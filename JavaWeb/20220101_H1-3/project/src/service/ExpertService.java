package service;

import java.util.List;

import dao.ExpertDao;
import model.Expert;

public class ExpertService {
  public static List<Expert> getExperts(String project_id) throws Exception{
    return ExpertDao.getExperts(project_id);
  }
}
