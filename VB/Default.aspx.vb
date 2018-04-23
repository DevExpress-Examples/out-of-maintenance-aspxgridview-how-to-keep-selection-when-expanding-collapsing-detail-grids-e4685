Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGridView
Imports System.Collections.Generic

Namespace SaveRestoreSelection
	Partial Public Class _Default
		Inherits System.Web.UI.Page

		#Region "SelectedRows"
		Private sessionKey As String = "SelectedRows"
		Private Property SelectedRows() As Dictionary(Of Object, List(Of Object))
			Get
				If Session(sessionKey) Is Nothing Then
					Session(sessionKey) = New Dictionary(Of Object, List(Of Object))()
				End If
				Return CType(Session(sessionKey), Dictionary(Of Object, List(Of Object)))
			End Get
			Set(ByVal value As Dictionary(Of Object, List(Of Object)))
				Session(sessionKey) = value
			End Set
		End Property
		#End Region

		Protected Sub productsGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
			Session("CategoryID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
		End Sub

		Protected Sub productsGrid_DataBound(ByVal sender As Object, ByVal e As EventArgs)
			Dim grid As ASPxGridView = CType(sender, ASPxGridView)
			Dim masterKey As Object = grid.GetMasterRowKeyValue()

			If SelectedRows.ContainsKey(masterKey) Then
				Dim selectedKeys As List(Of Object) = SelectedRows(masterKey)

				If selectedKeys IsNot Nothing Then
					RemoveHandler grid.SelectionChanged, AddressOf productsGrid_SelectionChanged

					For Each key In selectedKeys
						grid.Selection.SelectRowByKey(key)
					Next key

					AddHandler grid.SelectionChanged, AddressOf productsGrid_SelectionChanged
				End If
			Else
				SelectedRows.Add(masterKey, Nothing)
			End If

		End Sub

		Protected Sub productsGrid_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs)
			Dim grid As ASPxGridView = CType(sender, ASPxGridView)
			Dim masterKey As Object = grid.GetMasterRowKeyValue()
			Dim selectedKeys As List(Of Object) = grid.GetSelectedFieldValues(New String() { "ProductID" })

			SelectedRows(masterKey) = selectedKeys
		End Sub
	End Class
End Namespace
