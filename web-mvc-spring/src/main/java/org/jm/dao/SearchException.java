package org.jm.dao;

/**
 *
 * @author jgarcia
 */
public class SearchException extends RuntimeException {
    private static final long serialVersionUID = -8187375788182690007L;
    public SearchException(Throwable ex) {
        super(ex);
    }
}
