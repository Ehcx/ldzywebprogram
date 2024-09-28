package pojo;

import java.sql.Timestamp;

public class Enterprise {

    private String ent_id;
    private String ent_name;
    private Timestamp begin_date;
    private String addr;
    private double reg_capital;

    public Enterprise() {

    }

    public String getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(String ent_id) {
        this.ent_id = ent_id;
    }

    public String getEnt_name() {
        return ent_name;
    }

    public void setEnt_name(String ent_name) {
        this.ent_name = ent_name;
    }

    public Timestamp getBegin_date() {
        return begin_date;
    }

    public void setBegin_date(Timestamp begin_date) {
        this.begin_date = begin_date;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public double getReg_capital() {
        return reg_capital;
    }

    public void setReg_capital(double reg_capital) {
        this.reg_capital = reg_capital;
    }

    @Override
    public String toString() {
        return "Enterprise{" +
                "ent_id='" + ent_id + '\'' +
                ", ent_name='" + ent_name + '\'' +
                ", begin_date=" + begin_date +
                ", addr='" + addr + '\'' +
                ", reg_capital=" + reg_capital +
                '}';
    }
}
