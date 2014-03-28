<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- jBrowseDisplayer.jsp -->
<script type="text/javascript">

var expand = true;
function expandCollapse(){
if(expand){
  jQuery('iframe').css({height: '600px'});
}else{
  jQuery('iframe').css({height: '75px'});
}
expand = !expand;
}

</script>

<c:if test="${((!empty reportObject.object.chromosomeLocation && !empty reportObject.object.chromosome)
                || cld.unqualifiedName == 'Chromosome') && cld.unqualifiedName != 'ChromosomeBand'}">

  <div class="geneInformation">

    <h3 class="overlapping">Genome Browser</h3>
    

    <c:set var="baseUrl" value="${baseURL}"/>
    <c:set var="chr" value="${reportObject.object.chromosomeLocation.locatedOn.primaryIdentifier}"/>
    <c:set var="padding" value="${10}"/>
    <c:set var="offset" value="${fn:substringBefore((reportObject.object.length * 0.1), '.')}"/>

    <c:set var="start" value="${reportObject.object.chromosomeLocation.start - offset}"/>
    <c:set var="end" value="${reportObject.object.chromosomeLocation.end + offset}"/>
    <c:set var="genus" value="${reportObject.object.organism.genus}"/>
    <c:set var="species" value="${reportObject.object.organism.species}"/>
    <c:if test="${species == 'sapiens'}">
       <c:set var="tracks" value="NCBI"/>
    </c:if> 
    <c:set var="jbLink" value="${baseUrl}&loc=${chr}:${start}..${end}&tracks=${tracks}"/>

    <p>Click and drag the browser to move the view.  Drag and drop tracks from left menu into the main
	   panel to see the data. Clicking on individual features to open a report page for that feature.
	    <br/>
	    <strong>*</strong> denotes SNPs that are mapped to multiple genome position.
    <a href="${jbLink}" target="jbrowse">Center on ${reportObject.object.symbol}</a></p>
	<iframe name="jbrowse" height="300px" width="98%" style="border: 1px solid #dfdfdf; padding: 1%" src="${jbLink}"></iframe>
    <p><a href="javascript:;" onclick="javascript:expandCollapse();">Expand/Collapse viewer</a>&nbsp;(more about <a href="http://jbrowse.org">JBrowse</a>) &nbsp;
    <a href="${jbLink}" target="_blank">Open in new tab</a></p>
</div>

<!--

<script type="text/javascript">
/* <![CDATA[ */
var bookmarkCallback = function(brwsr) {
    return window.location.protocol
       + "//" + window.location.host
       + window.location.pathname
       + "?loc=" + brwsr.visibleRegion()
       + "&tracks=" + brwsr.visibleTracks();
    }
var dataDir = window.location.protocol
       + "//" + window.location.host
	   + "/jbrowse/data";
var b = new Browser({
    containerID: "GenomeBrowser",
    refSeqs: refSeqs,
    trackData: trackInfo,
    defaultTracks: "DNA,gene,mRNA,noncodingRNA",
    location: "chr${chr}:${start}..${end}",
    tracks: "${tracks}",
    bookmark: bookmarkCallback,
    dataRoot: dataDir
});

/* ]]> */
</script>

-->

</c:if>
<!-- /jBrowseDisplayer.jsp -->
