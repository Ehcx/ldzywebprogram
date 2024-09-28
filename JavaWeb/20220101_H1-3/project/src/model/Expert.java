package model;

public class Expert {
    private String expert_id;
    private String expert_name;
    private String id_card;
    private String dept;

    public String getExpert_id() {
        return expert_id;
    }

    public void setExpert_id(String expert_id) {
        this.expert_id = expert_id;
    }

    public String getExpert_name() {
        return expert_name;
    }

    public void setExpert_name(String expert_name) {
        this.expert_name = expert_name;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
}
