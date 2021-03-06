{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
<br />
&nbsp;&nbsp;<a href="index.php?module=MailMerge&view=createTemplates" style="" class="btn addButton"><i class="icon-plus icon-white"></i>&nbsp;<strong>Add Template</strong></a>
<br /><br />
<table width="100%" class="table-bordered" style="border: 1px solid #ddd;table-layout: fixed">
    <tr>{foreach item=RECORD from=$ALPHABETS}
        <td class="alphabetSearch textAlignCenter cursorPointer " style="padding : 0px !important;height:40px"><a id="A" href="index.php?module=MailMerge&view=Leads&search={$RECORD}"><div class="alphabetSorting noprint">{$RECORD}</div></a></td>
                {/foreach}
        </tr>
    </table>

    <form action="index.php" method="post" enctype="multipart/form-data" id="merge">

        <table class="table table-bordered listViewEntriesTable"><thead>
                <tr class="listViewHeaders" style="color:white;font-size: small;background-color: #0065a6">
                    <td><input type="checkbox" name="check_listall" id="selecctall" value="" /></td>
                    <td>Company</td>

                    <td>firstname</td>

                    <td>lastname</td>

                    <td>email</td>

                    <td>designation</td>


                </tr></thead><tbody>
                {foreach item=RECORD from=$RECORDS}

                    {assign var=COUNTER value=0}

                    <tr>
                        {foreach name=FIELDNAME item=FIELDVALUE from=$RECORD}
                            {if $COUNTER eq 0}
                                <td><input type="checkbox" name="check_list[]" class="listViewEntriesCheckBox" value="{$FIELDVALUE}" /></td>

                            {/if}  
                            {if $COUNTER eq 1}
                                <td>{$FIELDVALUE}</td>
                            {/if}  {assign var=COUNTER value=1}



                        {/foreach}</tr></tbody>

            {/foreach}

        </table>
        <br/>{if $LIMIT eq '0'}
        {else}
            <a onclick="document.getElementById('prev').submit();" class="btn" id="listViewPreviousPageButton" disabled="disabled" type="button"><span class="icon-chevron-left"></span></a>

            &nbsp; &nbsp;
            <a onclick="document.getElementById('next').submit();" class="btn" id="listViewNextPageButton" disabled="" type="button"><span class="icon-chevron-right"></span></a>
                {/if}

                <br/>{if $COUN eq '0'}
                 <form action="index.php" method="post" id="prev" >
            <input type="hidden" name="search" value="{$SEARCH}">
            <input type="hidden" name="module" value="MailMerge">
            <input type="hidden" name="view" value="Leads">
            <input type="hidden" name="page" value="{$PREV}">
            </form>
                <a href="index.php?module=MailMerge&view=createTemplates" style="background-color: #428bca" class="btn btn-primary">Create MergeTemplate</a>
                {else}
                    <b>Select template to merge: </b><select name="document">

                        {foreach item=RECORD from=$TEMPLATES}
                            <option value="{$RECORD['templateid']}">{$RECORD['filename']}</option>
                        {/foreach}

                    </select>

                    <br/>   

                    <input type="hidden" name="module" value="MailMerge">
                    <input type="hidden" name="view" value="createMergeLead">
                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button onclick="document.getElementById('merge').submit();" style="background-color: #428bca" class="btn btn-primary" id="merged">Merge</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a  href="index.php?module=MailMerge&view=mergeModule" name="button"  class="btn btn-info">Cancel</a>

                </form>
                {/if}
                    <script>$(document).ready(function() {
                            //$('#merged').bind(click);
                            $('#merged').click(function() {
                                var values = [];
                                $('.listViewEntriesCheckBox:checked').each(function() {
                                    values.push($(this).val());//alert($(this).val());
                                });
                                if (values.length == 0) {
                                    alert('select an entity');
                                    return false;
                                } else {
                                    $('#merged').hide();
                                    $('.btn-info').hide();
                                    return true;
                                }
                            });


                            $('#selecctall').click(function(event) {  //on click 
                                if (this.checked) { // check select status
                                    $('.listViewEntriesCheckBox').each(function() { //loop through each checkbox
                                        this.checked = true;  //select all checkboxes with class "checkbox1"               
                                    });
                                } else {
                                    $('.listViewEntriesCheckBox').each(function() { //loop through each checkbox
                                        this.checked = false; //deselect all checkboxes with class "checkbox1"                       
                                    });
                                }
                            });

                        });

                    </script>
                    {if $LIMIT eq '0'}
    {else}
        <form action="index.php" method="post" id="prev" >
            <input type="hidden" name="search" value="{$SEARCH}">
            <input type="hidden" name="module" value="MailMerge">
            <input type="hidden" name="view" value="Leads">
            <input type="hidden" name="page" value="{$PREV}">
            </form>
            &nbsp; &nbsp;
       <form action="index.php" method="post" id="next" >
            <input type="hidden" name="search" value="{$SEARCH}">
            <input type="hidden" name="module" value="MailMerge">
            <input type="hidden" name="view" value="Leads">
            <input type="hidden" name="page" value="{$NEXT}">
            </form> {/if}
