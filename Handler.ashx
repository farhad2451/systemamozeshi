<%@ WebHandler Language="VB"  Class="Handler" %>

'   You can pass the PhotoID as photo size to handler and get your photo
'   For example: handler.ashx?photoid=5&size=1
'   size indicate size of photo. 1: small, 2: medium, 3: larg, 4:original
Imports System.Web
Imports System.Web.Services

Public Class Handler
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        '  Try
           
        context.Response.ContentType = "image/jpeg"
        context.Response.Cache.SetCacheability(HttpCacheability.Public)
        context.Response.BufferOutput = False
        '
        Dim stream As IO.Stream = Nothing
        If ((Not (context.Request.QueryString("ID")) Is Nothing) AndAlso (context.Request.QueryString("ID") <> "")) Then
            stream = PhotoManager.GetPhoto(context.Request.QueryString("ID"))
            
        End If
            
        Dim buffersize As Integer = (1024 * 16)
        Dim buffer() As Byte = New Byte((buffersize) - 1) {}
        Dim count As Integer = stream.Read(buffer, 0, buffersize)

        Do While (count > 0)
            context.Response.OutputStream.Write(buffer, 0, count)
            count = stream.Read(buffer, 0, buffersize)
        Loop
        ' Catch ex As Exception

        'End Try
       
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class
