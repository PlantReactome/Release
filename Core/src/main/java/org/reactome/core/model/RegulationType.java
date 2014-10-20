package org.reactome.core.model;

// Generated Jul 8, 2011 1:48:55 PM by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;

/**
 * RegulationType generated by hbm2java
 */
@XmlRootElement
public class RegulationType extends DatabaseObject {
    private static final String POSITIVE = "POSITIVE"; // regulation that activates the reaction rate
    private static final String NEGATIVE = "NEGATIVE"; // regulation that slows down the reaction rate
    private static final String REQUIRED = "REQUIRED"; // regulation that is required for a reaction to occur.
    private String value;

    public static String getPOSITIVE() {
        return POSITIVE;
    }

    public static String getNEGATIVE() {
        return NEGATIVE;
    }

    public static String getREQUIRED() {
        return REQUIRED;
    }

    public RegulationType() {
    }

    public  RegulationType (String type) {
            if (type.equals("POSITIVE"))
                value =  POSITIVE;
            if (type.equals("NEGATIVE"))
                value = NEGATIVE;
            if (type.equals("REQUIRED"))
                value =  REQUIRED;
        }
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
