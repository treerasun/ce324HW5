<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Googlechart.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="/js/jsapi.js"></script>
    <script type="text/javascript" src="/js/uds_api_contents.js"></script>

    <script type="text/javascript">
        function drawVisualization() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Country'); 
            data.addColumn('number', 'Value');
            data.addColumn({ type: 'string', role: 'tooltip' });

            data.addRows([

                [{f: "United States of America" }, 1, "coun\n"+1+"time"+1],

                [{f: "United Kingdom" }, 5, "7% of visits"],

               

             

            ]);
            chart = new google.visualization.ColumnChart(document.getElementById('visualization'));
            chart.draw(data, {
                title: 'Company Performance',
                vAxis: { title: 'Year', titleTextStyle: { color: 'red' } },

                
            });
            google.visualization.events.addListener(chart, 'select', function () {

                var selection = chart.getSelection();
                var row = selection[0].row;
                var col = selection[0].column;
                var year = data.getValue(row, 0);
                location.href = 'http://localhost:59091/?row=' + row + '&col=' + col + '&year=' + year;
            });
        }
      google.setOnLoadCallback(drawVisualization);

    </script>
</head>
<body>
     <div id="visualization" style="width: 100%; height: 400px;"></div>
</body>
</html>
