package org.jm.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.jm.model.Role;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * This class tests the current LookupDao implementation class
 * @author mraible
 */
public class LookupDaoTest extends BaseDaoTestCase {
    @Autowired
    LookupDao lookupDao;

    @Test
    public void testGetRoles() {
        List<Role> roles = lookupDao.getRoles();
        log.debug(roles);
        assertTrue(roles.size() > 0);
    }
}
