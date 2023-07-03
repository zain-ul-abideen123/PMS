<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPatients.aspx.cs" Inherits="PatientManagementSystem.ViewPatients" %>

<!DOCTYPE html>
<head runat="server">
    <title>View Patients</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <style>
        #header
        {
            width:100vw;
            background-color: #10b981;
            box-shadow: 0 0 .1vw black;
            margin-bottom: 1vw;
            padding: 1vw 0vw;
            display: flex;
        }
        #logo
        {
            color: white;
            font-size: 30px;
            font-weight: bold;
            margin-left: 3vw;
            user-select:none;
        }
        #header-container
        {
            display: flex;
            margin-left: 4vw;
        }
        .header-button
        {
            font-size: 18px;
            font-weight: bold;
            color: white;
            align-self: center;
            margin-left: 1vw;
            text-decoration: none;
             user-select:none;
        }
    </style>
</head>
<body style="margin: 0vw;">

    <div id="header">
        <div id="logo">PSM</div>
        <div id="header-container">
            <a href="AddPatient.aspx" class="header-button">Add patient</a>
            <a href="ViewPatients.aspx" class="header-button">View patients</a>
        </div>
        
    </div>
    <%--var a;--%>
    <form id="form1" runat="server">
        <div>
            <table id="datatable" class="display">
                <thead>
                    <tr>
                        <th>
                        <input type="checkbox" id="master-checkbox" /></th>
                        <th>PatientID</th>
                        <th>FirstName</th>
                        <th>MiddleName</th>
                        <th>LastName</th>
                        <th>Gender</th>
                        <th>DateOfBirth</th>
                        <th>Status</th>
                        <th>Picture</th>
                    </tr>
                </thead>
            </table>
            <button type="button" id="delete-selected-btn">Delete Selected</button>
        </div>
    <script type="text/javascript">
        var table;
        var prevdata;
        $(document).ready(function () {
            loadData()
        })
        function loadData() {
            $.ajax({
                url: "ViewPatients.aspx/GetPatients",
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {

                    data = data.d;
                    if (prevdata != data) {
                        if (table) {
                            table.destroy()
                        }

                        if (data.length === 2) {

                            document.getElementById("delete-selected-btn").disabled = true;

                        }
                        else {
                            document.getElementById("delete-selected-btn").disabled = false;
                        }
                        prevdata = data
                        data = JSON.parse(data)
                        var columns = [
                            {
                                data: null,
                                render: function (data, type, row) {
                                    return '<input type="checkbox" class="row-checkbox">';
                                }
                            },
                            { data: "PatientID" },
                            { data: "FirstName" },
                            { data: "MiddleName" },
                            { data: "LastName" },
                            { data: "Gender" },
                            { data: "DateOfBirth" },
                            { data: "Status" },
                            {
                                data: "Picture",
                                render: function (data, type, row) {
                                    return '<img style="border-radius:100vw;width:100px; height:100px "  src=' + data + ' alt="Profile"/>';
                                }
                            },
                        ];



                        // Initialize the DataTable with the checkbox column
                        table = $('#datatable').DataTable({
                            data: data,
                            columns: columns
                        });
                    }
                }
            })


        }
        setInterval(() => {
            loadData()
        },1000)

        // Add event handler for the master checkbox selection
        $('#master-checkbox').on('change', function () {
            $('.row-checkbox').prop('checked', $(this).is(':checked'));
        });



        // Add event handler for individual row checkboxes
        $('#datatable').on('change', '.row-checkbox', function () {
            var checked = $('.row-checkbox:checked').length;
            var total = $('.row-checkbox').length;



            // Update the master checkbox state based on the row checkboxes
            $('#master-checkbox').prop('checked', checked === total);
        });



        // Add event handler for the "Delete Selected" button
        $('#delete-selected-btn').on('click', function () {

            var selectedRows = $('.row-checkbox:checked');
            var selectedIds = [];



            selectedRows.each(function () {
                var rowData = table.row($(this).closest('tr')).data();
                selectedIds.push(rowData.PatientID);
            });



            $.ajax({
                url: "ViewPatients.aspx/DeletePatients",
                method: 'POST',
                data: JSON.stringify({ ids: selectedIds }), // Convert the data to JSON string
                contentType: 'application/json', // Set the content type to JSON
                success: function () {
                    location.reload(); // Refresh the page
                },
                error: function (error) {
                    alert(error);
                    console.log(error);
                }
            });
        });
    </script>
    </form>



</body>
</html>
