<form class="m-form m-form--fit m-form--label-align-right form_detail" action="<?php echo base_url($url.'/detail_edit/'.$id) ?>" method="post">
  <div class="form-group">
    <label for="recipient-name" class="form-control-label">Menu link:</label>
    <input type="text" class="form-control" name="menu_link" placeholder="Masukkan link menu" value="<?php echo $records[0]->menu_link ?>">
  </div>
  <div class="form-group">
    <label for="message-text" class="form-control-label">Menu icon:</label>
    <input type="text" class="form-control" name="menu_icon" placeholder="Masukkan text icon flaticon" value="<?php echo $records[0]->menu_icon ?>">
  </div>
</form>