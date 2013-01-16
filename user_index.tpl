{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content_wrapper}}
    	<div class="content-wrapper events-content community-mobile-fix">
            <form name="input" action="" method="get">
            	<div class="inner-search">
                	<fieldset class="search">
                        <input type="text" name="search" placeholder="Benutzername oder Name">
                        <input type="submit" value="Go">
                    </fieldset>
                </div>
            </form>
        
        	<div class="content no-bottom-line equal-heights clearfix">
            
            	<div class="events-aside clearfix info-text">
                	
                    <div class="box desktop-hide phone-hide">
                        <select class="dropdownized">
                            <option value="Alle Themen">Alle Themen</option>
                            <option value="Energiepolitk">Energiepolitk</option>
                            <option value="AKW">AKW</option>
                        </select>
                    </div>
                    
                	<ul class="custom-list no-bullet phone-hide">
                    	<li class="active"><a href="{{ $view->url() }}">Alle Mitglieder</a></li>
                    	<li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default', true) }}?filter=active">Aktivste</a></li>
                    	<li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default', true) }}?filter=editors">Redaktion</a></li>
                    </ul>

                    <form id="get-by-alphabet" name="input" action="" method="get">
                        <select name="filter" class="dropdownized phone-hide">
                        	<option value="a-z">Nach Alphabet</option>
                        	<option value="a-z">a-z</option>
                        	<option value="a-d">a-d</option>
                            <option value="e-k">e-k</option>
                            <option value="l-p">l-p</option>
                            <option value="q-t">q-t</option>
                            <option value="u-z">u-z</option>
                        </select>
                    </form>
                    <script type="text/javascript">
                        $('form#get-by-alphabet select option[value={{ $smarty.get.filter|default:'' }}]').attr('selected', true);
                        $('form#get-by-alphabet select').change(function(){
                            $('form#get-by-alphabet').submit();
                        })
                    </script>
                    
                    <div class="box desktop-hide mobile-hide">
                        <h4>Zeige</h4>
                        <select class="dropdownized">
                            <option value="Alle Mitglieder">Alle Mitglieder</option>
                            <option value="Energiepolitk">Energiepolitk</option>
                            <option value="AKW">AKW</option>
                        </select>
                        <fieldset class="search">
                            <input type="text" placeholder="Name oder Benutzername">
                            <input type="submit" value="Go">
                        </fieldset>
                    </div>
                
                </div>
    
                <div class="main left-thumb community-list clearfix">
        {{ $length = 5 }}
        {{ $uri = $view->url() }}
        {{ $groups = "2,3,4,8" }}
        {{ if isset($smarty.get.search) }}
            {{ list_users length=$length search=$smarty.get.search  }}
                {{ include file="_tpl/user_index_user.tpl" user=$gimme->list_user }}
                {{ include file="_tpl/pagination.tpl" scope="parent" }}
            {{ /list_users }}
        {{ else if isset($smarty.get.filter) }}
            {{ if $smarty.get.filter == 'editors'}}
                {{ list_users length=$length filter=$smarty.get.filter editor_groups=$groups }}
                    {{ include file="_tpl/user_index_user.tpl" user=$gimme->list_user }}
                    {{ include file="_tpl/pagination.tpl" scope="parent" }}
                {{ /list_users }}
            {{ else }}
                {{ list_users length=$length filter=$smarty.get.filter editor_groups=$groups }}
                    {{ include file="_tpl/user_index_user.tpl" user=$gimme->list_user }}
                    {{ include file="_tpl/pagination.tpl" scope="parent" }}
                {{ /list_users }}
            {{ /if }}
        {{ else }}
            {{ list_users length=$length }}
                {{ include file="_tpl/user_index_user.tpl" user=$gimme->list_user }}
                {{ include file="_tpl/pagination.tpl" scope="parent" }}
            {{ /list_users }}
        {{ /if }}
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="{{ url static_file="pictures/ad-2.jpg" }}"></a>
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->
{{/block}}
