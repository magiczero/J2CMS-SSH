package org.j2cms.service;

import org.j2cms.model.assessment.Assessment;
import org.j2cms.service.base.DAO;

public interface AssessmentService extends DAO<Assessment> {

	Assessment getAemByProjectId(Integer id);
}
