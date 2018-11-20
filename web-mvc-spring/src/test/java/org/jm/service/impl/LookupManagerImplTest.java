package org.jm.service.impl;

import static org.junit.Assert.assertTrue;
import static org.mockito.BDDMockito.given;

import java.util.ArrayList;
import java.util.List;

import org.jm.Constants;
import org.jm.dao.LookupDao;
import org.jm.model.LabelValue;
import org.jm.model.Role;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;


public class LookupManagerImplTest extends BaseManagerMockTestCase {

    @Mock
    private LookupDao lookupDao;

    @InjectMocks
    private LookupManagerImpl mgr = new LookupManagerImpl();


    @Test
    public void testGetAllRoles() {
        log.debug("entered 'testGetAllRoles' method");

        //given
        Role role = new Role(Constants.ADMIN_ROLE);
        final List<Role> testData = new ArrayList<Role>();
        testData.add(role);

        given(lookupDao.getRoles()).willReturn(testData);

        //when
        List<LabelValue> roles = mgr.getAllRoles();

        //then
        assertTrue(roles.size() > 0);
    }

}
