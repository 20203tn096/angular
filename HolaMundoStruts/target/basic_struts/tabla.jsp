<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla de prueba</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.css">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
</head>

<body>

    <table id="table_id" class="display">
        <thead>
            <tr>
                <th>Column 1</th>
                <th>Column 2</th>
                <th>Column 1</th>
                <th>Column 2</th>
                <th>Column 2</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>

    <script>
        const data = [
            {
                "name": "Tiger Nixon",
                "position": "System Architect",
                "salary": "$3,120",
                "start_date": "2011/04/25",
                "office": "Edinburgh",
                "extn": "5421"
            },
            {
                "name": "Garrett Winters",
                "position": "Director",
                "salary": "$5,300",
                "start_date": "2011/07/25",
                "office": "Edinburgh",
                "extn": "8422"
            },
            {
                "name": "Garrett Winters",
                "position": "Director",
                "salary": "$5,300",
                "start_date": "2011/07/25",
                "office": "Edinburgh",
                "extn": "8422"
            },
            {
                "name": "Garrett Winters",
                "position": "Director",
                "salary": "$5,300",
                "start_date": "2011/07/25",
                "office": "Edinburgh",
                "extn": "8422"
            },
            {
                "name": "Garrett Winters",
                "position": "Director",
                "salary": "$5,300",
                "start_date": "2011/07/25",
                "office": "Edinburgh",
                "extn": "8422"
            }
        ]

        $('#table_id').DataTable({
            data: data,
            columns: [
                { data: 'name' },
                { data: 'position' },
                { data: 'salary' },
                { data: 'office' },
                { data: 'start_date' }
            ]
        });
    </script>

</body>

</html>