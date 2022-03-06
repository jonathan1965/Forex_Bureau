<%@page import="rw.ofbmrs.entities.BnrEmployee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="rw.ofbmrs.entities.ExchangeRate"%>
<%@page import="rw.ofbmrs.entities.ForeignCurrency"%>
<%@page import="rw.ofbmrs.passwordEncryption.Encryption"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="rw.ofbmrs.entities.Manager"%>
<%@page import="rw.ofbmrs.entities.ForexBureau"%>
<%@page import="rw.ofbmrs.entities.Cell"%>
<%@page import="rw.ofbmrs.entities.Sector"%>
<%@page import="rw.ofbmrs.entities.District"%>
<%@page import="rw.ofbmrs.entities.Province"%>
<%
    String output = "";
    String type = request.getParameter("type");
    if (type.equals("province")) {
        String name = request.getParameter("name");
        Province province = new Province();
        province.setName(name);
        try {
            province.create();
            output = "The province is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("district")) {
        String name = request.getParameter("name");
        String province = request.getParameter("province");
        District district = new District();
        district.setName(name);
        district.getProvince().setId(Integer.parseInt(province.trim()));
        try {
            district.create();
            output = "The district is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("sector")) {
        String name = request.getParameter("name");
        String district = request.getParameter("district");
        Sector sector = new Sector();
        sector.setName(name);
        sector.getDistrict().setId(Integer.parseInt(district.trim()));
        try {
            sector.create();
            output = "The sector is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("cell")) {
        String name = request.getParameter("name");
        String sector = request.getParameter("sector");
        Cell cell = new Cell();
        cell.setName(name);
        cell.getSector().setId(Integer.parseInt(sector.trim()));
        try {
            cell.create();
            output = "The cell is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("forexBureau")) {
        String licenseNo = request.getParameter("licenseNo");
        String name = request.getParameter("name");
        String cell = request.getParameter("cell");
        ForexBureau forexBureau = new ForexBureau();
        forexBureau.setName(name);
        forexBureau.setLicenseNo(licenseNo);
        forexBureau.getCell().setId(Integer.parseInt(cell.trim()));
        try {
            forexBureau.create();
            output = "The forex bureau is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("forexBureauManager")) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Manager manager = new Manager();
        manager.setFirstName(request.getParameter("firstName"));
        manager.setLastName(request.getParameter("lastName"));
        manager.setGender(request.getParameter("gender"));
        manager.setPhone(request.getParameter("phone"));
        manager.setEmail(request.getParameter("email"));
        manager.setDateOfBirth(sdf.parse(request.getParameter("dateOfBirth")));
        manager.setUsername(request.getParameter("username"));
        manager.setPassword(Encryption.md5(request.getParameter("password")));
        manager.setRole("FB Manager");
        manager.setStatus("Active");
        manager.getForexBureau().setLicenseNo(request.getParameter("forexBureau"));
        long dob = manager.getDateOfBirth().getTime() / 1000 / 3600 / 24;
        long tdy = new Date().getTime() / 1000 / 3600 / 24;

        try {
            if ((tdy - dob) / 365 > 17) {
                manager.create();
                output = "The Forex Bureau Manager is added";
            } else {
                output = "Sorry, the Forex Bureau Manager should not be under 18 years!";
            }

        } catch (Exception e) {
            output = e.getMessage();
        }

    } else if (type.equals("foreignCurrency")) {
        ForeignCurrency foreignCurrency = new ForeignCurrency();
        foreignCurrency.setUnit(request.getParameter("unit"));
        foreignCurrency.setCountry(request.getParameter("country"));
        try {
            foreignCurrency.create();
            output = "The Foreign Currency is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("exchangeRate")) {
        ExchangeRate exchangeRate = new ExchangeRate();
        exchangeRate.getForeignCurrency().setId(Integer.parseInt(request.getParameter("foreignCurrencyId")));
        exchangeRate.setActualPurchasingRate(Float.parseFloat(request.getParameter("actualPurRate")));
        exchangeRate.setActualSellingRate(Float.parseFloat(request.getParameter("actualSellRate")));
        exchangeRate.setDate(new Date());
        exchangeRate.setMaxPurchasingRate(Float.parseFloat(request.getParameter("maxPurRate")));
        exchangeRate.setMinPurchasingRate(Float.parseFloat(request.getParameter("minPurRate")));
        exchangeRate.setMaxSellingRate(Float.parseFloat(request.getParameter("maxSellRate")));
        exchangeRate.setMinSellingRate(Float.parseFloat(request.getParameter("minSellRate")));
        exchangeRate.setStatus("On use");
        try {
            List<ExchangeRate> list = exchangeRate.getAllByFC();
            for (ExchangeRate rate : list) {
                rate.setStatus("Old");
                rate.update();
            }
            exchangeRate.create();
            output = "The Exchange Rate is added";
        } catch (Exception e) {
            output = e.getMessage();
        }
    } else if (type.equals("bnrEmployee")) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        BnrEmployee employee = new BnrEmployee();
        employee.setFirstName(request.getParameter("firstName"));
        employee.setLastName(request.getParameter("lastName"));
        employee.setGender(request.getParameter("gender"));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setDateOfBirth(sdf.parse(request.getParameter("dateOfBirth")));
        employee.setUsername(request.getParameter("username"));
        employee.setPassword(Encryption.md5(request.getParameter("password")));
        employee.setRole("BNR Employee");
        employee.setStatus("Active");
        long dob = employee.getDateOfBirth().getTime() / 1000 / 3600 / 24;
        long tdy = new Date().getTime() / 1000 / 3600 / 24;
        try {
            if ((tdy - dob) / 365 > 17) {
            employee.create();
            output = "The BNR Employee is added";
            }else{
                output = "Sorry, the BNR Employee should not be under 18 years!";
            }
        } catch (Exception e) {
            output = e.getMessage();
        }
    }
    out.println(output);
%>
