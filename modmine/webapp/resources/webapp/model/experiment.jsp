<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="im"%>
<%@ taglib uri="http://flymine.org/imutil" prefix="imutil"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/string-1.1"
    prefix="str"%>


            
            
<style type="text/css">

.dbsources table.features {
  clear:left;
  font-size: small;
  border: none;
  background-color: green;
}

.dbsources table.features td {
  white-space:nowrap;
  padding: 3px; 
  border-left:1px solid;
  border-right: none;
  border-bottom: none;
  border-top:none;
  background-color: #DFA;
}

.dbsources table.features .firstrow {
  white-space:nowrap;
  padding: 3px; 
  border-top:none;
}

.dbsources table.features .firstcolumn {
  white-space: nowrap;
  padding: 3px;
  border-left: none;
}

div#experimentFeatures {
  color: black;
  margin: 20px;
  border: 1px;
  border-style: solid;
  border-color: green;
  background-color: #DFA;
  padding: 5px;
}

.submissionFeatures {
  color: black;
  margin-bottom: 20px;
  border: 1px;
  border-style: solid;
  border-color: green;
  background-color: #DFA;
  padding: 5px;
}

.submissions div {
  clear: both;
}

</style>


<tiles:importAttribute />


<html:xhtml />


<div class="body">

<c:forEach items="${experiments}" var="exp"  varStatus="status">

  <im:boxarea title="${exp.name}" stylename="gradientbox">

  <table cellpadding="0" cellspacing="0" border="0" class="dbsources">
  <tr><td>
    <c:forEach items="${exp.organisms}" var="organism" varStatus="orgStatus">
      <c:if test="${organism eq 'D. melanogaster'}"> 
        <img border="0" class="arrow" src="model/images/f_vvs.png" title="fly"/><br>
      </c:if>
      <c:if test="${organism eq 'C. elegans'}"> 
        <img border="0" class="arrow" src="model/images/w_vvs.png" title="worm"/><br>
      </c:if>
    </c:forEach> 
  </td>
  
  <td>experiment: <b><c:out value="${exp.name}"/></b></td>
  <td>project: <b><c:out value="${exp.projectName}"></c:out></b></td>
  <td>PI: <b><c:out value="${exp.pi}"></c:out></b></td>
  </tr>
  
  
  <tr>
  <td colspan="4"><c:out value="${exp.description}"></c:out></td>
  </tr>
  </table>


  <c:if test="${! empty exp.featureCounts}">
  <div id="experimentFeatures">
  
  <br/>
     <table>
     <tr>
     <td style="width: 45%" align="top">
      ALL FEATURES GENERATED BY THIS EXPERIMENT:
      <table cellpadding="0" cellspacing="0" border="0" class="dbsources">
      <tr>
        <th>Feature type</th>
        <th>Count</th>
        <th>View data</th>
        <th colspan="4">Export</th>
      </tr>
      <c:forEach items="${exp.featureCounts}" var="fc" varStatus="status">
          <tr>
            <td>${fc.key}</td>
            <td>${fc.value}</td>                     
            <td align="center">
              <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=experiment&action=results&experiment=${exp.name}&feature=${fc.key}">VIEW RESULTS</html:link>
            </td>
            <td align="center">
               <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=experiment&action=export&experiment=${exp.name}&feature=${fc.key}&format=tab">TAB
        <script type="text/javascript" charset="utf-8">
                jQuery(document).ready(function(){
                    jQuery('#header_${status.count}').qtip({
                       content: 'export as tab delimited file',
                       show: 'mouseover',
                       hide: 'mouseout',
                       position: {
                           corner: {
                              target: 'topLeft',
                              tooltip: 'bottomLeft'
                           }
                       },
                       style: {
                          tip: 'bottomLeft',
                          fontSize: '12px',
                          name: 'cream',
                          whiteSpace: 'nowrap'
                       }
                    });
                });
</script></html:link>
            
            </td>
            <td align="center">
              <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=experiment&action=export&experiment=${exp.name}&feature=${fc.key}&format=csv">CSV</html:link>
           
            </td>
            <td align="center">
             <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=experiment&action=export&experiment=${exp.name}&feature=${fc.key}&format=gff3">GFF3</html:link>
           
            </td>
          </tr>
      </c:forEach>
      <!-- end submission loop -->
    </table>
   </td>
   <td style="width: 40%; align: top;">
     GBROWSE TRACKS HERE
   </td>
   </tr>
</table>
    </div>
    </c:if>

<div class="submissions">
  <em>
  <c:choose>
    <c:when test="${exp.submissionCount == 0}">
      There are no submissions for this experiment:
    </c:when>
    <c:when test="${exp.submissionCount == 1}">
      There is <c:out value="${exp.submissionCount}"></c:out> <b><c:out value="${exp.experimentType}"></c:out></b> submission for this experiment:
    </c:when>
    <c:otherwise>
      There are <c:out value="${exp.submissionCount}"></c:out> <b><c:out value="${exp.experimentType}"></c:out></b> submissions for this experiment:   
    </c:otherwise>
    
  </c:choose>
  </em>
  <table cellpadding="0" cellspacing="0" border="0" class="dbsources">
  <tr>
    <td>DCC id</td>
    <td>name</td>
    <%--<td>type</td>--%>
    <td>date</td>
      <c:forEach items="${exp.factorTypes}" var="factor">
        <td><c:out value="${factor}"></c:out></td>
      </c:forEach>
    <td>features</td>
  </tr>

  
  <c:forEach items="${exp.submissionsAndFeatureCounts}" var="subCounts">
    
    <c:set var="sub" value="${subCounts.key}"></c:set>
    <tr>
      <td><html:link
        href="/${WEB_PROPERTIES['webapp.path']}/objectDetails.do?id=${subCounts.key.id}"><c:out value="${sub.dCCid}"></c:out></html:link></td>
      <td><html:link
        href="/${WEB_PROPERTIES['webapp.path']}/objectDetails.do?id=${subCounts.key.id}"><c:out value="${sub.title}"></c:out></html:link></td>
      <%-- <td><c:out value="${sub.experimentType}"></c:out></td> --%>
      <td><fmt:formatDate value="${sub.publicReleaseDate}" type="date"/></td>
      <c:forEach items="${exp.factorTypes}" var="factorType">
        <td>
          <c:forEach items="${sub.experimentalFactors}" var="factor" varStatus="status">
            <c:if test="${factor.type == factorType}">
              <c:choose>
                <c:when test="${factor.property != null}">
                  <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/objectDetails.do?id=${factor.property.id}">
                  <c:out value="${factor.name}"/>
                  </html:link>
                </c:when>
                <c:otherwise>
                  <c:out value="${factor.name}"/>          
                </c:otherwise>
              </c:choose>
            </c:if>      
          </c:forEach>
        </td>


      </c:forEach>
    <%--</tr>
   
    <tr>    
      <td colspan="${exp.factorCount + 5}">--%>
      <td>
      <c:if test="${!empty subCounts.value}">
      <div class="submissionFeatures">
      <table cellpadding="0" cellspacing="0" border="0" class="features">
      <c:forEach items="${subCounts.value}" var="fc" varStatus="rowNumber">
        
        <c:set var="class" value=""/>
        <c:if test="${rowNumber.first}">
          <c:set var="class" value="firstrow"/>
        </c:if>
        <tr>                 
          <td class="firstcolumn ${class}">${fc.key}:
              <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=submission&action=results&submission=${sub.dCCid}&feature=${fc.key}">${fc.value}</html:link>
          </td>
          <td class="${class}" align="right">
              export: 
               <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=submission&action=export&submission=${sub.dCCid}&feature=${fc.key}&format=tab">TAB</html:link>
               <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=submission&action=export&submission=${sub.dCCid}&feature=${fc.key}&format=csv">CSV</html:link>
               <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=submission&action=export&submission=${sub.dCCid}&feature=${fc.key}&format=gff3">GFF3</html:link>
          </td>
          <td class="${class}" align="right">
            <html:link
        href="/${WEB_PROPERTIES['webapp.path']}/features.do?type=submission&action=list&submission=${sub.dCCid}&feature=${fc.key}"> CREATE LIST</html:link>
          </td>
      </tr>
    </c:forEach>
    </table>
    </div>
    </c:if>
        </td>

    <%--</tr>--%>

  </c:forEach>


  </table>
</div>
  </im:boxarea>

</c:forEach>
</div>

