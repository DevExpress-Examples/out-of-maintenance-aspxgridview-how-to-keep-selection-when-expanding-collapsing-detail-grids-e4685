<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# ASPxGridView - How to keep Selection when expanding/collapsing detail grids


<p>This example demonstrates how to persist Selection when expanding/collapsing detail grids.</p><p>This functionality is implemented by handling the following ASPxGridView events:<br />
1. <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_SelectionChangedtopic"><u>ASPxGridView.SelectionChanged Event</u></a> - Selection is saved to a Dictionary.<br />
2. <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxClassesASPxDataWebControlBase_DataBoundtopic"><u>ASPxDataWebControlBase.DataBound Event</u></a> - Selection is restored from a Dictionary.</p><p><strong>See Also</strong><strong>:<br />
</strong><a href="https://www.devexpress.com/Support/Center/p/E355">E355: How to select detail rows on master row selection</a><u><br />
</u><a href="https://www.devexpress.com/Support/Center/p/E2246">E2246: ASPxGridView - How to keep selection in detail grids when paging the master grid within a ASPxCheckBox in a DataItemTemplate</a></p>

<br/>


