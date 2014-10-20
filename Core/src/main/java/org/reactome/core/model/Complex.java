package org.reactome.core.model;

// Generated Jul 8, 2011 1:48:55 PM by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Complex generated by hbm2java
 */
@XmlRootElement
public class Complex extends PhysicalEntity {

    private Boolean isChimeric;
    private String totalProt;
    private String maxHomologues;
    private String inferredProt;
    private List<PhysicalEntity> hasComponent;
    private List<PhysicalEntity> entityOnOthercell;
    private List<EntityCompartment> includedLocation;
    private List<Species> species;

    public List<PhysicalEntity> getEntityOnOthercell() {
        return entityOnOthercell;
    }

    public void setEntityOnOthercell(List<PhysicalEntity> entityOnOthercell) {
        this.entityOnOthercell = entityOnOthercell;
    }

    public List<EntityCompartment> getIncludedLocation() {
        return includedLocation;
    }

    public void setIncludedLocation(List<EntityCompartment> includedLocation) {
        this.includedLocation = includedLocation;
    }

    public List<Species> getSpecies() {
        return species;
    }

    public void setSpecies(List<Species> species) {
        this.species = species;
    }

    public List<PhysicalEntity> getHasComponent() {
        return hasComponent;
    }

    public void setHasComponent(List<PhysicalEntity> hasComponent) {
        this.hasComponent = hasComponent;
    }
    
    public Complex() {
    }

    public Boolean getIsChimeric() {
        return this.isChimeric;
    }

    public void setIsChimeric(Boolean isChimeric) {
        this.isChimeric = isChimeric;
    }

    public String getTotalProt() {
        return this.totalProt;
    }

    public void setTotalProt(String totalProt) {
        this.totalProt = totalProt;
    }

    public String getMaxHomologues() {
        return this.maxHomologues;
    }

    public void setMaxHomologues(String maxHomologues) {
        this.maxHomologues = maxHomologues;
    }

    public String getInferredProt() {
        return this.inferredProt;
    }

    public void setInferredProt(String inferredProt) {
        this.inferredProt = inferredProt;
    }

}
