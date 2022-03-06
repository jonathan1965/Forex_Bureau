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
    if(type.equals("foreignCurrency")){
        ForeignCurrency foreignCurrency = new ForeignCurrency();
        foreignCurrency.setUnit(request.getParameter("unit"));
        foreignCurrency.setCountry(request.getParameter("country"));
        try{
            foreignCurrency.create();
            output = "The Foreign Currency is added";
        }catch(Exception e){
            output = e.getMessage();
        }
    } else if(type.equals("exchangeRate")){
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
        try{
            List<ExchangeRate>list = exchangeRate.getAllByFC();
            for(ExchangeRate rate : list){
                rate.setStatus("Old");
                rate.update();
            }
            exchangeRate.create();
            output = "The Exchange Rate is added";
        }catch(Exception e){
            output = e.getMessage();
        }
    } 
    out.println(output);
%>
