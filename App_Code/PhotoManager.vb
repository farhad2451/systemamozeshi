' Photo manager Version 1.1(2008/8/25 9:30)
' New features in 1.1(Author: Ali Gonabadi :& Mojtabaw)
' GetPhoto method edited to match with our program


Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports System.Configuration

Public Class PhotoManager

    Public Overloads Shared Function GetPhoto(ByVal photoid As Integer) As Stream
        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("DatabaseConnectionString1").ConnectionString)
            Using command As New SqlCommand("SELECT Photo  FROM Photos WHERE ID = @ID", connection)
                command.Parameters.Add(New SqlParameter("@ID", photoid))
                connection.Open()
                Dim result As Object = command.ExecuteScalar
                'Try
                Return New MemoryStream(CType(result, Byte()))
                ' Catch
                Return Nothing
                ' End Try
            End Using
        End Using
    End Function

    Public Shared Sub AddPhoto(ByVal AlbumID As Integer, ByVal Description As String, ByVal BytesOriginal() As Byte)

        Dim stream As MemoryStream = New System.IO.MemoryStream(BytesOriginal)
        Dim OldImage As Bitmap = New Bitmap(stream)

        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("DatabaseConnectionString1").ConnectionString)
            Using command As New SqlCommand( _
            "INSERT INTO Photos (AlbumID, Comments,Photo ) VALUES " + _
            "(@AlbumID, @Comments, @Photo )", connection)

                command.Parameters.Add(New SqlParameter("@AlbumID", AlbumID))
                command.Parameters.Add(New SqlParameter("@Comments", Description))
                command.Parameters.Add(New SqlParameter("@Photo", ResizeImageFile(BytesOriginal, 800)))
                connection.Open()
                command.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Public Shared Sub AddAboutPhoto(ByVal BytesOriginal() As Byte)

        Dim stream As MemoryStream = New System.IO.MemoryStream(BytesOriginal)
        Dim OldImage As Bitmap = New Bitmap(stream)

        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("DatabaseConnectionString1").ConnectionString)
            Using command As New SqlCommand("UPDATE CollectionTable SET AboutPhoto = @AboutPhoto WHERE fid=1 ", connection)

                command.Parameters.Add(New SqlParameter("@AboutPhoto", ResizeImageFile(BytesOriginal, 550)))
                connection.Open()
                command.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Private Shared Function ResizeImageFile(ByVal imageFile() As Byte, ByVal targetSize As Integer) As Byte()
        Using oldImage As System.Drawing.Image = System.Drawing.Image.FromStream(New MemoryStream(imageFile))
            Dim newSize As Size = CalculateDimensions(oldImage.Size, targetSize)
            Using newImage As Bitmap = New Bitmap(newSize.Width, newSize.Height, PixelFormat.Format24bppRgb)
                Using canvas As Graphics = Graphics.FromImage(newImage)
                    canvas.SmoothingMode = SmoothingMode.AntiAlias
                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic
                    canvas.PixelOffsetMode = PixelOffsetMode.HighQuality
                    canvas.DrawImage(oldImage, New Rectangle(New Point(0, 0), newSize))
                    Dim m As New MemoryStream
                    newImage.Save(m, ImageFormat.Jpeg)
                    Return m.GetBuffer
                End Using
            End Using
        End Using
    End Function

    Private Shared Function CalculateDimensions(ByVal oldSize As Size, ByVal targetSize As Integer) As Size
        Dim newSize As Size
        If (oldSize.Height > oldSize.Width) Then
            newSize.Width = CType((oldSize.Width * CType((targetSize / CType(oldSize.Height, Single)), Single)), Integer)
            newSize.Height = targetSize
        Else
            newSize.Width = targetSize
            newSize.Height = CType((oldSize.Height * CType((targetSize / CType(oldSize.Width, Single)), Single)), Integer)
        End If
        Return newSize
    End Function

    Public Overloads Shared Function GetAboutPhoto() As Stream
        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("DatabaseConnectionString1").ConnectionString)
            Using command As New SqlCommand("SELECT AboutPhoto FROM CollectionTable WHERE fid=1 ", connection)
                connection.Open()
                Dim result As Object = command.ExecuteScalar
                'Try
                Return New MemoryStream(CType(result, Byte()))
                ' Catch
                Return Nothing
                ' End Try
            End Using
        End Using
    End Function

End Class
