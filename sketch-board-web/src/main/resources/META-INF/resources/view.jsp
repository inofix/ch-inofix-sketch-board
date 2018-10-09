<%--
    view.jsp
--%>

<%@ include file="/init.jsp" %>

<%
    long requestSketchBoardId = Long.valueOf((Long) renderRequest
                        .getAttribute("sketchBoardId"));

    SketchBoard sketchBoard = null;

    SketchBoardService sketchBoardService = SketchBoardServiceUtil.getService();
    if (sketchBoardId > 0) {

        sketchBoard = sketchBoardService.getSketchBoard(sketchBoardId);
    }

    String name = "";
    String description = "";
    String configuration = "";
    String setup = "";

    if (sketchBoard != null) {

        name = sketchBoard.getName();
        description = sketchBoard.getDescription();
        configuration = sketchBoard.getConfiguration();
        setup = sketchBoard.getSetup();
    }
%>
<portlet:actionURL name="addSketchBoard" var="addSketchBoardURL"></portlet:actionURL>

<portlet:renderURL var="openBoardURL">
    <portlet:param name="mvcPath" value="/list.jsp"></portlet:param>
</portlet:renderURL>

<div id="<portlet:namespace />-all" width="100%" height="2000px">
<%--
        <aui:button-row>
            <button id="<portlet:namespace />-save-board-button" class="btn btn-default" type="button">Save Board</button>
            <button id="<portlet:namespace />-save-board-as-button" class="btn btn-default" type="button">Save Board As</button>
            <aui:button onClick="<%= openBoardURL.toString() %>" value="Open Board"></aui:button>
            <button id="<portlet:namespace />-clear-board-button" class="btn btn-default" type="button">New Board</button>
        </aui:button-row>
--%>
    </div>
    <div id="<portlet:namespace />-persist">
        <aui:form
            action="<%= addSketchBoardURL %>"
            name="<portlet:namespace />-fm">

            <aui:fieldset>
                <aui:input name="sketchBoardId"
                    type="hidden" value="<%=sketchBoardId%>"></aui:input>
                <aui:input name="name"
                    value="<%=name%>"></aui:input>
                <aui:input name="description"
                    value="<%=description%>"></aui:input>
                <aui:input name="configuration"
                    value="<%=configuration%>"></aui:input>
                <aui:input id="-json" name="setup"
                    type="textarea" value="<%=setup%>"></aui:input>
            </aui:fieldset>
            <aui:button-row>
                <button id="<portlet:namespace />-json-svg-button"
                    class="btn btn-default" type="button">
                    <liferay-ui:message key="button-switch-to-frontend" />
                </button>
                <button id="<portlet:namespace />-cancel-button"
                    class="btn btn-cancel" type="button" onclick="reset()">
                    <liferay-ui:message key="button-reset" />
                </button>
                <aui:button type="submit"></aui:button>
                <button id="<portlet:namespace />-cancel-button"
                    class="btn btn-cancel" type="button" onclick="reset(); window.location.reload();">
                    <liferay-ui:message key="cancel" />
                </button>
            </aui:button-row>
        </aui:form>
    </div>

    <div id="<portlet:namespace />-board" class="board">
        <aui:button-row>
            <button
                id="<portlet:namespace />-svg-json-button"
                class="btn btn-default"
                type="button">
                    <liferay-ui:message key="button-switch-to-backend" />
            </button>
        </aui:button-row>
        <hr />
        <svg id="<portlet:namespace />-mainSVG" width="100%" height="2000px"></svg>
    </div>
</div>
<aui:script require="sketch-board-web@1.0.0">
    sketchBoardWeb100.default('<portlet:namespace />', '<%=setup.replaceAll("\n", "")%>');
</aui:script>

