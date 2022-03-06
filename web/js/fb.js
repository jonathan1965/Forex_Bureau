$(document).ready(function () {
    $('#login_btn').click(function () {
        var username = $('#username').val();
        var password = $('#password').val();

        if (username.trim() === "" || password.trim() === "") {
            $('#login_error').text('');
            if (username.trim() === "") {
                var cdiv = $('#username').closest("div");
                cdiv.removeClass('has-success');
                cdiv.addClass('has-error');
            } else {
                var cdiv = $('#username').closest("div");
                cdiv.removeClass('has-error');
                cdiv.addClass('has-success');
            }
            if (password.trim() === "") {
                var cdiv = $('#password').closest("div");
                cdiv.removeClass('has-success');
                cdiv.addClass('has-error');
            } else {
                var cdiv = $('#password').closest("div");
                cdiv.removeClass('has-error');
                cdiv.addClass('has-success');
            }
        } else {
            var pcdiv = $('#password').closest('div');
            var ucdiv = $('#username').closest('div');
            pcdiv.addClass('has-success');
            pcdiv.removeClass('has-error');
            ucdiv.addClass('has-success');
            ucdiv.removeClass('has-error');
            $.ajax({
                url: 'login.jsp',
                method: 'POST',
                dataType: 'text',
                data: {username: username, password: password},
                success: function (data) {
                    if (data.trim() === 'Admin') {
                        window.location.replace('../U/Admin/index.jsp');
                    } else if (data.trim() === 'Teller') {
                        window.location.replace('../U/Teller/index.jsp');
                    } else if (data.trim() === 'FB Manager') {
                        window.location.replace('../U/Manager/index.jsp');
                    } else if (data.trim() === 'BNR Employee') {
                        window.location.replace('../U/BNR/index.jsp');
                    } else {
                        $('#login_error').text(data);
                    }
                }
            });
        }
    });
});

$('a').click(function (e) {
    e.preventDefault();
    var ref = $(this).attr('href');
    
    if (ref === 'report') {
        $('#content').load(ref + ".jsp");
        viewReport('selling');
    }else if(ref === 'fbTeller'){
        $('#content').load("teller.jsp");
        viewFbTellers();
    }else {
        $('#content').load(ref + ".jsp");
        if (ref === 'location') {
            ref = 'province';
        } else if (ref === 'users') {
            ref = 'allUsers';
        }
        viewData(ref);
    }

});


function viewFbTellers(){
    $.ajax({
        url: 'fetch.jsp',
        type: 'POST',
        dataType:'text',
        success: function (data) {
            $('#content').find('#t_data').html(data);
        }
    });
}


function viewReport(key) {
    var type = key;
    $.ajax({
        url: 'viewReport.jsp',
        type: 'POST',
        dataType:'text',
        data: {type: type},
        success: function (data) {
            $('#content').find('#t_data').html(data);
        }
    });
}

$(document).on('change', '#reportType', function () {
    viewReport($(this).val());
});

$(document).on('change', '#loc', function () {
    viewData($(this).val());
});

var dialog = $('#dialog');
dialog.dialog({
    autoOpen: false,
    modal: true,
    width: 400,
    resizable: false,
    draggable: false
});

$(document).on('click', '#new_loc', function () {
    var loc = $('#content').find('#loc').val();
    if (loc === 'province') {
        dialog.load('newProvince.jsp').dialog('open');
    } else if (loc === 'district') {
        dialog.load('newDistrict.jsp').dialog('open');
    } else if (loc === 'sector') {
        dialog.load('newSector.jsp').dialog('open');
    } else if (loc === 'cell') {
        dialog.load('newCell.jsp').dialog('open');
    }
});

$(document).on('click', '#new_btn', function () {
    var type = $(this).data('type');
    if (type === 'fb') {
        dialog.load('newForexBureau.jsp').dialog('open');
    } else if (type === 'fc') {
        dialog.load('newForeignCurrency.jsp').dialog('open');
    } else if (type === 'er') {
        dialog.load('newExchangeRate.jsp').dialog('open');
    } else if (type === 'teller') {
        dialog.load('newTeller.jsp').dialog('open');
    } else if (type === 'purchase') {
        dialog.load('newPurchase.jsp').dialog('open');
    } else if (type === 'sale') {
        dialog.load('newSale.jsp').dialog('open');
    }
});

$('form.formData').on('submit', function () {
    var form = $(this),
            url = form.attr('action'),
            type = form.attr('method'),
            data = {};

    form.find('[name]').each(function (index, value) {
        var input = $(this),
                name = input.attr('name'),
                value = input.val();
        data[name] = value;
    });

    $.ajax({
        url: url,
        type: type,
        data: data,
        success: function (data) {
            alert(data);
            dialog.dialog('close');
        }
    });
    return false;
});

function viewData(searchKey) {
    var type = searchKey;
    $.ajax({
        url: '/OFBMRS/ViewData',
        type: 'POST',
        data: {type: type},
        success: function (data) {
            var jsonData = JSON.parse(data);
            if (type === 'allUsers') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>FIRST NAME</th><th class='text-center'>LAST NAME</th><th class='text-center'>GENDER</th><th class='text-center'>PHONE</th><th class='text-center'>EMAIL</th><th class='text-center'>ROLE</th><th class='text-center'>USERNAME</th><th class='text-center'>STATUS</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.users.length; i++) {
                    table += '<tr><td>' + jsonData.users[i].FirstName + '</td>';
                    table += '<td>' + jsonData.users[i].LastName + '</td>';
                    table += '<td>' + jsonData.users[i].Gender + '</td>';
                    table += '<td>' + jsonData.users[i].Phone + '</td>';
                    table += '<td>' + jsonData.users[i].Email + '</td>';
                    table += '<td>' + jsonData.users[i].Role + '</td>';
                    table += '<td>' + jsonData.users[i].Username + '</td>';
                    table += '<td>' + jsonData.users[i].Status + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'FBManagers') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>FIRST NAME</th><th class='text-center'>LAST NAME</th><th class='text-center'>GENDER</th><th class='text-center'>PHONE</th><th class='text-center'>EMAIL</th><th class='text-center'>USERNAME</th><th class='text-center'>FOREX BUREAU</th><th class='text-center'>STATUS</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.managers.length; i++) {
                    table += '<tr><td>' + jsonData.managers[i].FirstName + '</td>';
                    table += '<td>' + jsonData.managers[i].LastName + '</td>';
                    table += '<td>' + jsonData.managers[i].Gender + '</td>';
                    table += '<td>' + jsonData.managers[i].Phone + '</td>';
                    table += '<td>' + jsonData.managers[i].Email + '</td>';
                    table += '<td>' + jsonData.managers[i].Username + '</td>';
                    table += '<td>' + jsonData.managers[i].ForexBureau + '</td>';
                    table += '<td>' + jsonData.managers[i].Status + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'teller') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>FIRST NAME</th><th class='text-center'>LAST NAME</th><th class='text-center'>GENDER</th><th class='text-center'>PHONE</th><th class='text-center'>EMAIL</th><th class='text-center'>USERNAME</th><th class='text-center'>FOREX BUREAU</th><th class='text-center'>STATUS</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.tellers.length; i++) {
                    table += '<tr><td>' + jsonData.tellers[i].FirstName + '</td>';
                    table += '<td>' + jsonData.tellers[i].LastName + '</td>';
                    table += '<td>' + jsonData.tellers[i].Gender + '</td>';
                    table += '<td>' + jsonData.tellers[i].Phone + '</td>';
                    table += '<td>' + jsonData.tellers[i].Email + '</td>';
                    table += '<td>' + jsonData.tellers[i].Username + '</td>';
                    table += '<td>' + jsonData.tellers[i].ForexBureau + '</td>';
                    table += '<td>' + jsonData.tellers[i].Status + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'BNRUsers') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>FIRST NAME</th><th class='text-center'>LAST NAME</th><th class='text-center'>GENDER</th><th class='text-center'>PHONE</th><th class='text-center'>EMAIL</th><th class='text-center'>USERNAME</th><th class='text-center'>STATUS</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.bnrUsers.length; i++) {
                    table += '<tr><td>' + jsonData.bnrUsers[i].FirstName + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].LastName + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].Gender + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].Phone + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].Email + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].Username + '</td>';
                    table += '<td>' + jsonData.bnrUsers[i].Status + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'forexBureau') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>LICENSE NO</th><th class='text-center'>NAME</th><th class='text-center'>CELL</th><th class='text-center'>SECTOR</th><th class='text-center'>DISTRICT</th><th class='text-center'>PROVINCE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.forexBureaus.length; i++) {
                    table += '<tr><td>' + jsonData.forexBureaus[i].LicenseNo + '</td>';
                    table += '<td>' + jsonData.forexBureaus[i].Name + '</td>';
                    table += '<td>' + jsonData.forexBureaus[i].Cell + '</td>';
                    table += '<td>' + jsonData.forexBureaus[i].Sector + '</td>';
                    table += '<td>' + jsonData.forexBureaus[i].District + '</td>';
                    table += '<td>' + jsonData.forexBureaus[i].Province + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'foreignCurrency') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>UNIT</th><th class='text-center'>COUNTRY</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.foreignCurrencies.length; i++) {
                    table += '<tr><td>' + jsonData.foreignCurrencies[i].ID + '</td>';
                    table += '<td>' + jsonData.foreignCurrencies[i].Unit + '</td>';
                    table += '<td>' + jsonData.foreignCurrencies[i].Country + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'exchangeRate') {
                
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>ACTUAL PURCHASING RATE</th><th class='text-center'>ACTUAL SELLING RATE</th><th class='text-center'>MINIMUM PURCHASING RATE</th><th class='text-center'>MAXIMUM PURCHASING RATE</th><th class='text-center'>MINIMUM SELLING RATE</th><th class='text-center'>MAXIMUM SELLING RATE</th><th class='text-center'>FOREIGN CURRENCY</th><th class='text-center'>DATE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.exchangeRates.length; i++) {
                    table += '<tr><td>' + jsonData.exchangeRates[i].ID + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].ActualPurchasingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].ActualSellingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].MinimumPurchasingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].MaximumPurchasingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].MinimumSellingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].MaximumSellingRate + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].ForeignCurrency + '</td>';
                    table += '<td>' + jsonData.exchangeRates[i].UpdateDate + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'province') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>NAME</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.provinces.length; i++) {
                    table += '<tr><td>' + jsonData.provinces[i].ID + '</td>';
                    table += '<td>' + jsonData.provinces[i].Name + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'district') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>NAME</th><th class='text-center'>PROVINCE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.districts.length; i++) {
                    table += '<tr><td>' + jsonData.districts[i].ID + '</td>';
                    table += '<td>' + jsonData.districts[i].Name + '</td>';
                    table += '<td>' + jsonData.districts[i].Province + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'sector') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>NAME</th><th class='text-center'>DISTRICT</th><th class='text-center'>PROVINCE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.sectors.length; i++) {
                    table += '<tr><td>' + jsonData.sectors[i].ID + '</td>';
                    table += '<td>' + jsonData.sectors[i].Name + '</td>';
                    table += '<td>' + jsonData.sectors[i].District + '</td>';
                    table += '<td>' + jsonData.sectors[i].Province + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'cell') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>NAME</th><th class='text-center'>SECTOR</th><th class='text-center'>DISTRICT</th><th class='text-center'>PROVINCE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.cells.length; i++) {
                    table += '<tr><td>' + jsonData.cells[i].ID + '</td>';
                    table += '<td>' + jsonData.cells[i].Name + '</td>';
                    table += '<td>' + jsonData.cells[i].Sector + '</td>';
                    table += '<td>' + jsonData.cells[i].District + '</td>';
                    table += '<td>' + jsonData.cells[i].Province + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'purchase') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>CLIENT</th><th class='text-center'>FOREIGN CURRENCY</th><th class='text-center'>EXCHANGE RATE</th><th class='text-center'>AMOUNT IN FOREIGN CURRENCY</th><th class='text-center'>AMOUNT IN RWANDAN FRANCS</th><th class='text-center'>PURPOSE</th><th class='text-center'>SOURCE</th><th class='text-center'>DATE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.purchases.length; i++) {
                    table += '<tr><td>' + jsonData.purchases[i].ID + '</td>';
                    table += '<td>' + jsonData.purchases[i].Client + '</td>';
                    table += '<td>' + jsonData.purchases[i].ForeignCurrency + '</td>';
                    table += '<td>' + jsonData.purchases[i].ExchangeRate + '</td>';
                    table += '<td>' + jsonData.purchases[i].FcAmount + '</td>';
                    table += '<td>' + jsonData.purchases[i].LcAmount + '</td>';
                    table += '<td>' + jsonData.purchases[i].Purpose + '</td>';
                    table += '<td>' + jsonData.purchases[i].Source + '</td>';
                    table += '<td>' + jsonData.purchases[i].Date + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            } else if (type === 'sale') {
                var table = "<table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'><tr style='background-color: #245269; color:lightgray;'>";
                table += "<th class='text-center'>ID</th><th class='text-center'>CLIENT</th><th class='text-center'>FOREIGN CURRENCY</th><th class='text-center'>EXCHANGE RATE</th><th class='text-center'>AMOUNT IN FOREIGN CURRENCY</th><th class='text-center'>AMOUNT IN RWANDAN FRANCS</th><th class='text-center'>PURPOSE</th><th class='text-center'>Destination</th><th class='text-center'>DATE</th>";
                table += '</tr>';
                for (var i = 0; i < jsonData.sales.length; i++) {
                    table += '<tr><td>' + jsonData.sales[i].ID + '</td>';
                    table += '<td>' + jsonData.sales[i].Client + '</td>';
                    table += '<td>' + jsonData.sales[i].ForeignCurrency + '</td>';
                    table += '<td>' + jsonData.sales[i].ExchangeRate + '</td>';
                    table += '<td>' + jsonData.sales[i].FcAmount + '</td>';
                    table += '<td>' + jsonData.sales[i].LcAmount + '</td>';
                    table += '<td>' + jsonData.sales[i].Purpose + '</td>';
                    table += '<td>' + jsonData.sales[i].Destination + '</td>';
                    table += '<td>' + jsonData.sales[i].Date + '</td></tr>';
                }

                table += '</table>';
                $('#content').find('#t_data').html(table);
            }
        }
    });
}

$(document).on('click', '#new_user', function () {

    if ($('#users').val() === 'FBManagers') {
        dialog.load('newFbManager.jsp').dialog('open');
    } else if ($('#users').val() === 'BNRUsers') {
        dialog.load('newBnrUser.jsp').dialog('open');
    }

});

$(document).on('change', '#users', function () {
    viewData($(this).val());
});

