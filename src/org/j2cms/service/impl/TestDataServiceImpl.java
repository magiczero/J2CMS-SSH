package org.j2cms.service.impl;

import org.j2cms.model.testdata.TestData;
import org.j2cms.service.TestDataService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class TestDataServiceImpl extends DaoSupport<TestData> implements
		TestDataService {


}
