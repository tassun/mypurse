<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr id="fschapterrow">
	<td colspan="${fsPager.colspan}">
	<form name="fschapterform" id="fschapterform" method="post" action="${fsPager.action}" autocomplete="off">
		<input type="hidden" name="fsAction" value="chapter"></input>
		<input type="hidden" name="fsAjax" value="true"></input>
		<input type="hidden" name="fsDatatype" value="text"/>
		<input type="hidden" name="fsChapter" value="${fsPager.chapter}"></input>
		<input type="hidden" name="fsLimit" value="${fsPager.limit}"></input>
		<input type="hidden" name="fsPage" value="${fsGlobal.fsPage}"></input>
		<input type="hidden" name="fsSorter" value=""></input>
	</form>
	<div id="fschapterlayer">
<c:if test="${fsGlobal.hasPaging(fsPager.rows)}">
	${fsGlobal.createPaging(fsPager.rows)}
</c:if>
	</div>			
	<label id="fstotalrecordsrowlabel" style="display:none;" class="control-label pull-right">&nbsp; ${fsLabel.getLabel("totalrowlabel")}</label>
	<label id="fstotalrecords" style="display:none;" class="control-label pull-right">&nbsp;${fsPager.rows}&nbsp;</label>
	<label id="fstotalrecordslabel" style="display:none;" class="control-label pull-right">${fsLabel.getLabel("totallabel")}&nbsp;</label>
	</td>
</tr>
