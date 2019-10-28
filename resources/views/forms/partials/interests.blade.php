<!-- User Profile Form Fragment - INTERESTS and HOBBIES -->
<div class="field"> 
  <h3>Interests</h3>
  <div class="control has-icons-left has-icons-right">   
    <span class="icon is-small is-right">
      <i class="fa fa-check"></i>
    </span>   
      <input name="interests['Outdoors']" type="checkbox"> <label class="label is-small">Activities - Outdoor</label>
      <!-- These chkbxes are endabled when group checkbox is selected -->
      <label class="checkbox" disabled>
        <input type="checkbox" name="interests['Outdoors']['Nature']" disabled> Hiking Trails, Nature, Parks, Botanical Gardens   	
      </label>

      <label class="checkbox" disabled>
        <input type="checkbox" name="interests['Outdoors']['Sports']" disabled> Sports (Tennis, Golf, etc.)
      </label>       
  </div>
</div>
<!-- end INTERESTS -->