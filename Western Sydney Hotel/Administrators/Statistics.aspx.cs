using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Western_Sydney_Hotel.Administrators
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void charttype_SelectedIndexChanged(object sender, EventArgs e)
        {
            String chType = charttype.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chType);
            Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chType);

            String chDimension = chartdimension.SelectedValue;
            if (chDimension.Equals("3D"))
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            }
            else
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            }
        }

        protected void chartdimension_SelectedIndexChanged(object sender, EventArgs e)
        {
            String chType = charttype.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chType);
            Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chType);

            String chDimension = chartdimension.SelectedValue;
            if (chDimension.Equals("3D"))
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            }
            else
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            }
        }

    }
}