package service;

import dao.StepDao;
import entity.Step;

import java.util.List;

public class StepService {
    public static List<Step> getAllStep() throws Exception{
        return StepDao.getAllStep();
    }

    public static void add(Step step) throws Exception{
        StepDao.add(step);
    }

    public static void del(Step step) throws Exception{
        StepDao.del(step);
    }
}
