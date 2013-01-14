      <div id="top" class="clearfix">
{{ local }} 
            <a href="#" class="desktop-hide mobile-nav-trigger">Ressorts</a>       
            <ul class="left">
              {{ set_publication identifier="2" }}
              {{ set_current_issue }}            
        {{ list_sections constraints="number smaller_equal 70 number not 50" }}          
              <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
           {{ /list_sections }}
              {{ set_section number="100" }}
           	  <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
            </ul>
            
            <ul>
              {{ set_section number="90" }}            
              <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
              {{ set_publication identifier="4" }}
              {{ set_current_issue }}
              <li><a href="{{ url options="issue" }}">Blogs</a></li>
            </ul>            
            <ul class="right">
              {{ set_publication identifier="2" }}
              {{ set_current_issue }}
              {{ set_section number="71" }}            
              <li><a href="{{ url options="section" }}">{{ set_section number="80" }}{{ $gimme->section->name }}</a></li>
            </ul>
{{ /local }}        
        </div><!-- / Top -->