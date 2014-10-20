package org.reactome.core.model;

// Generated Jul 8, 2011 1:48:55 PM by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * EntitySet generated by hbm2java
 */
@XmlRootElement
public class EntitySet extends PhysicalEntity {

    private String totalProt;
    private String inferredProt;
    private String maxHomologues;
    private List<PhysicalEntity> hasMember;
    private List<Species> species;

    public EntitySet() {
    }

    public String getTotalProt() {
        return this.totalProt;
    }

    public void setTotalProt(String totalProt) {
        this.totalProt = totalProt;
    }

    public String getInferredProt() {
        return this.inferredProt;
    }

    public List<PhysicalEntity> getHasMember() {
        return hasMember;
    }

    public void setHasMember(List<PhysicalEntity> hasMember) {
        this.hasMember = hasMember;
    }

    public List<Species> getSpecies() {
        return species;
    }

    public void setSpecies(List<Species> species) {
        this.species = species;
    }

    public void setInferredProt(String inferredProt) {
        this.inferredProt = inferredProt;
    }

    public String getMaxHomologues() {
        return this.maxHomologues;
    }

    public void setMaxHomologues(String maxHomologues) {
        this.maxHomologues = maxHomologues;
    }

}
