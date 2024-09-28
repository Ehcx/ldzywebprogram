package entity;

public class Project {
    private String project_id;
    private String project_name;
    private String deputy_name;
    private String telephone;
    private String addr;

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getDeputy_name() {
        return deputy_name;
    }

    public void setDeputy_name(String deputy_name) {
        this.deputy_name = deputy_name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
