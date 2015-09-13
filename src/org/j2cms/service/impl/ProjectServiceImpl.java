package org.j2cms.service.impl;

import org.j2cms.model.project.Project;
import org.j2cms.service.ProjectService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class ProjectServiceImpl extends DaoSupport<Project> implements
		ProjectService {

}
