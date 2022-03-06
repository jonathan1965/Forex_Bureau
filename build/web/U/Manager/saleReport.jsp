<%@page import="rw.ofbmrs.entities.Teller"%>
<%@page import="rw.ofbmrs.entities.Sale"%>
<%@page import="rw.ofbmrs.entities.Purchase"%>
<%@page import="rw.ofbmrs.entities.User"%>
<%@page import="rw.ofbmrs.entities.Manager"%>
<%@page import="com.itextpdf.text.pdf.draw.*"%>
<%@page import="com.itextpdf.text.Font.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="java.io.*"%>
<%

    response.setContentType("application/pdf");
    DataOutputStream output = new DataOutputStream(response.getOutputStream());
    Document document = new Document();
    ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, buffer);
    document.open();
    Date tdy = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Paragraph p1 = new Paragraph();
    p1.add(new Chunk("KIGALI - RWANDA", new Font(FontFamily.TIMES_ROMAN, 12, Font.ITALIC, BaseColor.BLACK)));
    p1.setTabSettings(new TabSettings(465));
    p1.add(Chunk.TABBING);
    p1.add(new Chunk(sdf.format(tdy), new Font(FontFamily.TIMES_ROMAN, 12, Font.ITALIC, BaseColor.BLACK)));
    document.add(p1);
    LineSeparator separator = new LineSeparator(new Font(FontFamily.TIMES_ROMAN, 12, Font.ITALIC, BaseColor.LIGHT_GRAY));
    document.add(separator);
    Paragraph space = new Paragraph("\n\n\n\n\n");
    document.add(space);
    Paragraph header = new Paragraph();
    header.setAlignment(1);
    Manager manager = new Manager();
    manager.setUsername(((User) session.getAttribute("user")).getUsername());
    manager = manager.getByUsername();
    Phrase phrase1 = new Phrase(new Chunk("REPORT OF SELLING TRANSACTIONS", new Font(FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLACK)));
    Phrase phrase2 = new Phrase(new Chunk("" + manager.getForexBureau().getName().toUpperCase(), new Font(FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK)));

    header.add(phrase1);
    header.add(new Chunk("\n\n"));
    header.add(phrase2);
    document.add(header);
    document.add(space);
    PdfPTable table = new PdfPTable(10);
    table.setWidthPercentage(100);
    PdfPCell cell1 = new PdfPCell();
    cell1.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp1 = new Paragraph("ID", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp1.setAlignment(1);
    cell1.addElement(cp1);
    cell1.setBorder(0);
    PdfPCell cell2 = new PdfPCell();
    cell2.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp2 = new Paragraph("CLIENT", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp2.setAlignment(1);
    cell2.addElement(cp2);
    cell2.setBorder(0);
    cell2.setPaddingBottom(10);
    PdfPCell cell3 = new PdfPCell();
    cell3.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp3 = new Paragraph("FOREIGN CURRENCY", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp3.setAlignment(1);
    cell3.addElement(cp3);
    cell3.setBorder(0);
    PdfPCell cell4 = new PdfPCell();
    cell4.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp4 = new Paragraph("EXCHANGE RATE", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp4.setAlignment(1);
    cell4.addElement(cp4);
    cell4.setBorder(0);
    PdfPCell cell5 = new PdfPCell();
    cell5.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp5 = new Paragraph("AMOUNT IN FOREIGN CURRENCY", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp5.setAlignment(1);
    cell5.addElement(cp5);
    cell5.setBorder(0);
    PdfPCell cell6 = new PdfPCell();
    cell6.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp6 = new Paragraph("AMOUNT IN RWANDAN FRANCS", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp6.setAlignment(1);
    cell6.addElement(cp6);
    cell6.setBorder(0);
    PdfPCell cell7 = new PdfPCell();
    cell7.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp7 = new Paragraph("DATE", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp7.setAlignment(1);
    cell7.addElement(cp7);
    cell7.setBorder(0);
    PdfPCell cell8 = new PdfPCell();
    cell8.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp8 = new Paragraph("PURPOSE", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp8.setAlignment(1);
    cell8.addElement(cp8);
    cell8.setBorder(0);
    PdfPCell cell9 = new PdfPCell();
    cell9.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp9 = new Paragraph("DESTINATION COUNTRY", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp9.setAlignment(1);
    cell9.addElement(cp9);
    cell9.setBorder(0);
    PdfPCell cell10 = new PdfPCell();
    cell10.setBackgroundColor(new BaseColor(24, 52, 69));
    Paragraph cp10 = new Paragraph("TELLER", new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.LIGHT_GRAY));
    cp10.setAlignment(1);
    cell10.addElement(cp10);
    cell10.setBorder(0);
    table.addCell(cell1);
    table.addCell(cell2);
    table.addCell(cell3);
    table.addCell(cell4);
    table.addCell(cell5);
    table.addCell(cell6);
    table.addCell(cell7);
    table.addCell(cell8);
    table.addCell(cell9);
    table.addCell(cell10);
    Sale sale = new Sale();
    List<Sale> sales = sale.getAllSales();
    for (Sale sl : sales) {
        Teller teller = new Teller();
        teller.setUsername(sl.getUser().getUsername());
        teller = teller.getByUsername();
        if (teller.getForexBureau().getLicenseNo().equals(manager.getForexBureau().getLicenseNo())) {
            PdfPCell c1 = new PdfPCell();
            Paragraph id = new Paragraph(sl.getId() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            id.setAlignment(1);
            c1.addElement(id);
            c1.setBorder(0);
            PdfPCell c2 = new PdfPCell();
            Paragraph names = new Paragraph(sl.getClient().getNames() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            names.setAlignment(1);
            c2.addElement(names);
            c2.setBorder(0);
            PdfPCell c3 = new PdfPCell();
            Paragraph currency = new Paragraph(sl.getExchangeRate().getForeignCurrency().getUnit(), new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            currency.setAlignment(1);
            c3.addElement(currency);
            c3.setBorder(0);
            PdfPCell c4 = new PdfPCell();
            Paragraph rate = new Paragraph(sl.getExchangeRate().getActualSellingRate() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            rate.setAlignment(1);
            c4.addElement(rate);
            c4.setBorder(0);
            PdfPCell c5 = new PdfPCell();
            Paragraph fcAmount = new Paragraph(sl.getFcAmount() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            fcAmount.setAlignment(1);
            c5.addElement(fcAmount);
            c5.setBorder(0);
            PdfPCell c6 = new PdfPCell();
            Paragraph lcAmount = new Paragraph(sl.getLcAmount() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            lcAmount.setAlignment(1);
            c6.addElement(lcAmount);
            c6.setBorder(0);
            PdfPCell c7 = new PdfPCell();
            Paragraph date = new Paragraph(sl.getTransDate() + "", new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            date.setAlignment(1);
            c7.addElement(date);
            c7.setBorder(0);
            PdfPCell c8 = new PdfPCell();
            Paragraph purpose = new Paragraph(sl.getPurpose(), new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            purpose.setAlignment(1);
            c8.addElement(purpose);
            c8.setBorder(0);
            PdfPCell c9 = new PdfPCell();
            Paragraph destination = new Paragraph(sl.getDestinationCountry(), new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            destination.setAlignment(1);
            c9.addElement(destination);
            c9.setBorder(0);
            PdfPCell c10 = new PdfPCell();
            Paragraph user = new Paragraph(sl.getUser().getUsername(), new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK));
            user.setAlignment(1);
            c10.addElement(user);
            c10.setBorder(0);
            c1.setPaddingBottom(10);
            table.addCell(c1);
            table.addCell(c2);
            table.addCell(c3);
            table.addCell(c4);
            table.addCell(c5);
            table.addCell(c6);
            table.addCell(c7);
            table.addCell(c8);
            table.addCell(c9);
            table.addCell(c10);
        }
    }
    int j = 0;
    for (PdfPRow row : table.getRows()) {
        if (j != 0) {
            if (j % 2 == 0) {
                int c = 0;
                while (row.getCells().length > c) {
                    row.getCells()[c].setBackgroundColor(BaseColor.LIGHT_GRAY);
                    c++;
                }
            }
        }
        j++;
    }
    document.add(table);
    document.close();
    byte[] bytes = buffer.toByteArray();

    response.setContentLength(bytes.length);
    for (int i = 0; i < bytes.length; i++) {
        output.write(bytes[i]);
    }

    output.flush();

    output.close();

%>
