using System;
using DevExpress.Web.ASPxGridView;
using System.Collections.Generic;

namespace SaveRestoreSelection {
    public partial class _Default : System.Web.UI.Page {

        #region SelectedRows
        string sessionKey = "SelectedRows";
        Dictionary<object, List<object>> SelectedRows {
            get {
                if (Session[sessionKey] == null)
                    Session[sessionKey] = new Dictionary<object, List<object>>();
                return (Dictionary<object, List<object>>)Session[sessionKey];
            }
            set {
                Session[sessionKey] = value;
            }
        } 
        #endregion

        protected void productsGrid_DataSelect(object sender, EventArgs e) {
            Session["CategoryID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void productsGrid_DataBound(object sender, EventArgs e) {
            ASPxGridView grid = (ASPxGridView)sender;
            object masterKey = grid.GetMasterRowKeyValue();

            if (SelectedRows.ContainsKey(masterKey)) {
                List<object> selectedKeys = SelectedRows[masterKey];

                if (selectedKeys != null) {
                    grid.SelectionChanged -= productsGrid_SelectionChanged;

                    foreach (var key in selectedKeys)
                        grid.Selection.SelectRowByKey(key);

                    grid.SelectionChanged += productsGrid_SelectionChanged;
                }
            } else
                SelectedRows.Add(masterKey, null);

        }

        protected void productsGrid_SelectionChanged(object sender, EventArgs e) {
            ASPxGridView grid = (ASPxGridView)sender;
            object masterKey = grid.GetMasterRowKeyValue();
            List<object> selectedKeys = grid.GetSelectedFieldValues(new string[] { "ProductID" });

            SelectedRows[masterKey] = selectedKeys;
        }
    }
}
