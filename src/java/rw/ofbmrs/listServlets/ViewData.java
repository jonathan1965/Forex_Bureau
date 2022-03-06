/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.listServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import rw.ofbmrs.entities.BnrEmployee;
import rw.ofbmrs.entities.Cell;
import rw.ofbmrs.entities.District;
import rw.ofbmrs.entities.ExchangeRate;
import rw.ofbmrs.entities.ForeignCurrency;
import rw.ofbmrs.entities.ForexBureau;
import rw.ofbmrs.entities.Manager;
import rw.ofbmrs.entities.Province;
import rw.ofbmrs.entities.Purchase;
import rw.ofbmrs.entities.Sale;
import rw.ofbmrs.entities.Sector;
import rw.ofbmrs.entities.Teller;
import rw.ofbmrs.entities.User;

/**
 *
 * @author kay
 */
public class ViewData extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String output = "";
        try (PrintWriter out = response.getWriter()) {
            String type = request.getParameter("type");
            switch (type) {
                case "allUsers":
                    output = getUsers().toString();
                    break;
                case "FBManagers":
                    output = getManagers().toString();
                    break;
                case "BNRUsers":
                    output = getBnrUsers().toString();
                    break;
                case "forexBureau":
                    output = getForexBureaus().toString();
                    break;
                case "foreignCurrency":
                    output = getForeignCurrencies().toString();
                    break;
                case "exchangeRate":
                    output = getExchangeRates().toString();
                    break;
                case "province":
                    output = getProvinces().toString();
                    break;
                case "district":
                    output = getDistricts().toString();
                    break;
                case "sector":
                    output = getSectors().toString();
                    break;
                case "cell":
                    output = getCells().toString();
                    break;
                case "teller":
                    output = getTellers().toString();
                    break;
                case "purchase":
                    output = getPurchases().toString();
                    break;
                case "sale":
                    output = getSales().toString();
                    break;
                default:
                    break;
            }
            out.println(output);
            out.flush();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public JSONObject getUsers(){
        User user = new User();
        List<User> users = user.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (User u : users) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("FirstName", u.getFirstName());
                formDetails.put("LastName", u.getLastName());
                formDetails.put("Gender", u.getGender());
                formDetails.put("Phone", u.getPhone());
                formDetails.put("Email", u.getEmail());
                formDetails.put("Role", u.getRole());
                formDetails.put("Username", u.getUsername());
                formDetails.put("Status", u.getStatus());
                jsonArray.add(formDetails);
            }
            responseDetails.put("users", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getManagers(){
        Manager manager = new Manager();
        List<Manager> managers = manager.getAllManagers();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Manager u : managers) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("FirstName", u.getFirstName());
                formDetails.put("LastName", u.getLastName());
                formDetails.put("Gender", u.getGender());
                formDetails.put("Phone", u.getPhone());
                formDetails.put("Email", u.getEmail());
                formDetails.put("ForexBureau", u.getForexBureau().getName());
                formDetails.put("Username", u.getUsername());
                formDetails.put("Status", u.getStatus());
                jsonArray.add(formDetails);
            }
            responseDetails.put("managers", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getTellers(){
        Teller teller = new Teller();
        List<Teller> tellers = teller.getAllTellers();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Teller u : tellers) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("FirstName", u.getFirstName());
                formDetails.put("LastName", u.getLastName());
                formDetails.put("Gender", u.getGender());
                formDetails.put("Phone", u.getPhone());
                formDetails.put("Email", u.getEmail());
                formDetails.put("ForexBureau", u.getForexBureau().getName());
                formDetails.put("Username", u.getUsername());
                formDetails.put("Status", u.getStatus());
                jsonArray.add(formDetails);
            }
            responseDetails.put("tellers", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getBnrUsers(){
        BnrEmployee bnrEmp = new BnrEmployee();
        List<BnrEmployee> bnrEmps = bnrEmp.getAllBnrEmployees();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (BnrEmployee u : bnrEmps) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("FirstName", u.getFirstName());
                formDetails.put("LastName", u.getLastName());
                formDetails.put("Gender", u.getGender());
                formDetails.put("Phone", u.getPhone());
                formDetails.put("Email", u.getEmail());
                formDetails.put("Username", u.getUsername());
                formDetails.put("Status", u.getStatus());
                jsonArray.add(formDetails);
            }
            responseDetails.put("bnrUsers", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getForexBureaus(){
        ForexBureau forexBureau = new ForexBureau();
        List<ForexBureau> forexBureaus = forexBureau.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (ForexBureau fb : forexBureaus) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("LicenseNo", fb.getLicenseNo());
                formDetails.put("Name", fb.getName());
                formDetails.put("Cell", fb.getCell().getName());
                formDetails.put("Sector", fb.getCell().getSector().getName());
                formDetails.put("District", fb.getCell().getSector().getDistrict().getName());
                formDetails.put("Province", fb.getCell().getSector().getDistrict().getProvince().getName());
                jsonArray.add(formDetails);
            }
            responseDetails.put("forexBureaus", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getExchangeRates(){
        ExchangeRate exchangeRate = new ExchangeRate();
        List<ExchangeRate> exchangeRates = exchangeRate.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (ExchangeRate ex : exchangeRates) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", ex.getId());
                formDetails.put("ActualPurchasingRate", ex.getActualPurchasingRate());
                formDetails.put("ActualSellingRate", ex.getActualSellingRate());
                formDetails.put("MinimumPurchasingRate", ex.getMinPurchasingRate());
                formDetails.put("MaximumPurchasingRate", ex.getMaxPurchasingRate());
                formDetails.put("MinimumSellingRate", ex.getMinSellingRate());
                formDetails.put("MaximumSellingRate", ex.getMaxSellingRate());
                formDetails.put("ForeignCurrency", ex.getForeignCurrency().getUnit());
                formDetails.put("UpdateDate", ex.getDate().toString());
                jsonArray.add(formDetails);
            }
            responseDetails.put("exchangeRates", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getProvinces(){
        Province province = new Province();
        List<Province> provinces = province.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Province prov : provinces) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", prov.getId());
                formDetails.put("Name", prov.getName());
                jsonArray.add(formDetails);
            }
            responseDetails.put("provinces", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getDistricts(){
        District district = new District();
        List<District> districts = district.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (District dis : districts) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", dis.getId());
                formDetails.put("Name", dis.getName());
                formDetails.put("Province", dis.getProvince().getName());
                jsonArray.add(formDetails);
            }
            responseDetails.put("districts", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getSectors(){
        Sector sector = new Sector();
        List<Sector> sectors = sector.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Sector sec : sectors) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", sec.getId());
                formDetails.put("Name", sec.getName());
                formDetails.put("District", sec.getDistrict().getName());
                formDetails.put("Province", sec.getDistrict().getProvince().getName());
                jsonArray.add(formDetails);
            }
            responseDetails.put("sectors", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getCells(){
        Cell cell = new Cell();
        List<Cell> cells = cell.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Cell ce : cells) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", ce.getId());
                formDetails.put("Name", ce.getName());
                formDetails.put("Sector", ce.getSector().getName());
                formDetails.put("District", ce.getSector().getDistrict().getName());
                formDetails.put("Province", ce.getSector().getDistrict().getProvince().getName());
                jsonArray.add(formDetails);
            }
            responseDetails.put("cells", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getForeignCurrencies(){
        ForeignCurrency foreignCurrency = new ForeignCurrency();
        List<ForeignCurrency> foreignCurrencies = foreignCurrency.getAll();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (ForeignCurrency focur : foreignCurrencies) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", focur.getId());
                formDetails.put("Unit", focur.getUnit());
                formDetails.put("Country", focur.getCountry());
                jsonArray.add(formDetails);
            }
            responseDetails.put("foreignCurrencies", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getPurchases(){
        Purchase purchase = new Purchase();
        List<Purchase>list = purchase.getAllPurchases();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Purchase pur : list) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", pur.getId());
                formDetails.put("Client", pur.getClient().getNames());
                formDetails.put("ForeignCurrency", pur.getExchangeRate().getForeignCurrency().getUnit());
                formDetails.put("ExchangeRate", pur.getExchangeRate().getActualPurchasingRate());
                formDetails.put("FcAmount", pur.getFcAmount());
                formDetails.put("LcAmount", pur.getLcAmount());
                formDetails.put("Purpose", pur.getPurpose());
                formDetails.put("Source", pur.getSourcesOfFund());
                formDetails.put("Date", pur.getTransDate().toString());
                jsonArray.add(formDetails);
            }
            responseDetails.put("purchases", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
    
    public JSONObject getSales(){
        Sale sale = new Sale();
        List<Sale>list = sale.getAllSales();
        JSONObject responseDetails = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        try {
            for (Sale sl : list) {
                JSONObject formDetails = new JSONObject();
                formDetails.put("ID", sl.getId());
                formDetails.put("Client", sl.getClient().getNames());
                formDetails.put("ForeignCurrency", sl.getExchangeRate().getForeignCurrency().getUnit());
                formDetails.put("ExchangeRate", sl.getExchangeRate().getActualPurchasingRate());
                formDetails.put("FcAmount", sl.getFcAmount());
                formDetails.put("LcAmount", sl.getLcAmount());
                formDetails.put("Purpose", sl.getPurpose());
                formDetails.put("Destination", sl.getDestinationCountry());
                formDetails.put("Date", sl.getTransDate().toString());
                jsonArray.add(formDetails);
            }
            responseDetails.put("sales", jsonArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDetails;
    }
}
