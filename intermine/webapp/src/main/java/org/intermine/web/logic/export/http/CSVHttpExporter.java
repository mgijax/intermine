package org.intermine.web.logic.export.http;

/*
 * Copyright (C) 2002-2018 FlyMine
 *
 * This code may be freely distributed and modified under the
 * terms of the GNU Lesser General Public Licence.  This should
 * be distributed with the code.  See the LICENSE file for more
 * information or http://www.gnu.org/copyleft/lesser.html.
 *
 */

import java.util.List;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.intermine.web.logic.export.Exporter;
import org.intermine.web.logic.export.ExporterImpl;
import org.intermine.web.logic.export.ResponseUtil;
import org.intermine.web.logic.export.rowformatters.CSVRowFormatter;


/**
 * Exporter that exports table with results in comma separated format.
 * @author Jakub Kulaviak
 **/
public class CSVHttpExporter extends StandardHttpExporter
{

    /**
     * Constructor.
     */
    public CSVHttpExporter() { }

    /**
     * {@inheritDoc}
     */
    @Override
    protected void setResponseHeader(HttpServletResponse response, boolean doGzip) {
        if (doGzip) {
            ResponseUtil.setGzippedHeader(response, "results-table.csv.gz");
        } else {
            ResponseUtil.setCSVHeader(response, "results-table.csv");
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected Exporter getExporter(OutputStream out, String separator, List<String> headers) {
        return new ExporterImpl(out, new CSVRowFormatter(), separator, headers);
    }
}