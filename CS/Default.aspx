<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SaveRestoreSelection._Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dxwgv:ASPxGridView ID="masterGrid" runat="server"
                DataSourceID="masterDataSource" KeyFieldName="CategoryID" Width="100%" AutoGenerateColumns="False">
                <Columns>
                    <dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <Templates>
                    <DetailRow>
                        <dxwgv:ASPxGridView ID="productsGrid" runat="server"
                            AutoGenerateColumns="False" DataSourceID="productsDataSource"
                            KeyFieldName="ProductID" OnBeforePerformDataSelect="productsGrid_DataSelect"
                            Width="100%" OnDataBound="productsGrid_DataBound" OnSelectionChanged="productsGrid_SelectionChanged">
                            <Columns>
                                <dxwgv:GridViewDataColumn FieldName="ProductID" VisibleIndex="0">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="ProductName" VisibleIndex="1">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="QuantityPerUnit" VisibleIndex="2">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="c">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataColumn FieldName="UnitsInStock" VisibleIndex="4">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="Discontinued" VisibleIndex="5">
                                </dxwgv:GridViewDataColumn>
                            </Columns>
                            <SettingsDetail IsDetailGrid="True" />
                            <SettingsBehavior AllowSelectByRowClick="true" />
                        </dxwgv:ASPxGridView>
                    </DetailRow>
                </Templates>
                <Settings ShowGroupPanel="True" />
                <SettingsDetail ShowDetailRow="True" />
                <SettingsCustomizationWindow Enabled="True" />
            </dxwgv:ASPxGridView>

            <asp:AccessDataSource ID="masterDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>

            <asp:AccessDataSource ID="productsDataSource" runat="server"
                DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = ?)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="CategoryID" SessionField="CategoryID" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
