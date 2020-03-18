<?php
$saver_enabled        =    riake('gui_saver', $meta);
$autoload            =    riake('autoload', $meta);
// If Using namespace is enabled
if ($saver_enabled && riake('use_namespace', $meta)) {
    $form_option        =    $this->options->get(riake('namespace', $meta));
}

foreach (force_array(riake('items', $meta)) as $_item) {
    $name           =    @$_item[ 'name' ];
    $type           =    @$_item[ 'type' ];
    $placeholder    =    @$_item[ 'placeholder' ];
    $value          =    @$_item[ 'value' ];
    $icon           =    @$_item[ 'icon' ];
    $label          =    @$_item[ 'label' ];
    $rows           =    @$_item[ 'rows' ];
    $disabled       =    @$_item[ 'disabled' ];
    $description    =    @$_item[ 'description' ];
    $active         =    @$_item[ 'active' ];

    // fetch option from dashboard

    if ($saver_enabled && ! in_array($type, array( 'html-list', 'dom', 'file-input', 'html-error', 'table', 'buttons' ))) {
        // if namespace is used
        if (riake('use_namespace', $meta) === true) {
            $value    =    ($db_value        =    riake($name, $form_option)) ? $db_value : $value;
        } elseif (@$meta[ 'autoload' ] == true) { // fetch option directly from options table
            // To avoid fetching from global cols,
            $_item[ 'user_id' ]    =    @$_item[ 'user_id' ] == null ? 0 : $_item[ 'user_id' ];

            if (@$_item[ 'user_id' ] != null) {
                $value    =    ($db_value    =    $this->options->get($name, $_item[ 'user_id' ])) ? $db_value : $value;
            } else {
                $value    =    ($db_value    =    $this->options->get($name)) ? $db_value : $value;
            }
        }
    }
    if (in_array($type, array( 'text', 'password', 'email', 'tel' ))) {
        if (riake('label', $_item)) {
            ?>
        <div class="input-group" style="margin-bottom:5px;">
            <span class="input-group-addon"><?php echo riake('label', $_item);
            ?></span>
            <input <?php echo $disabled === true ? 'readonly="readonly"' : '';
            ?> type="<?php echo $type;
            ?>" name="<?php echo riake('name', $_item);
            ?>" class="form-control" placeholder="<?php echo riake('placeholder', $_item);
            ?>" value="<?php echo $value;
            ?>">
        </div>

        <p>
		<?php echo xss_clean($description);?></p>
        <?php
        } else {
            ?>
         <input <?php echo $disabled === true ? 'readonly="readonly"' : '';
            ?> type="<?php echo $type;
            ?>" name="<?php echo riake('name', $_item);
            ?>" class="form-control" placeholder="<?php echo riake('placeholder', $_item);
            ?>" value="<?php echo $value;
            ?>">
         <p><?php echo xss_clean($description);?></p><?php

        }
    } elseif ($type == 'textarea') {
        ?>
     <div class="form-group">
       <label><?php echo $label;
        ?></label>
       <textarea <?php echo $disabled === true ? 'disabled="disabled"' : '';
        ?> class="form-control" rows="3" placeholder="<?php echo $placeholder;
        ?>" name="<?php echo $name;
        ?>"><?php echo $value;
        ?></textarea>
       <p><?php echo xss_clean($description);?></p>
     </div>
     <?php

    } elseif ($type == 'editor') {
        global $editor_time_called;
        $editor_time_called = ($editor_time_called == null) ? 0 : $editor_time_called;
        $editor_time_called++;
        ?>
     <div class="form-group">
       <label><?php echo $label;
        ?></label>
       <textarea id="editor-<?php echo $editor_time_called;
        ?>" <?php echo $disabled === true ? 'disabled="disabled"' : '';
        ?> class="form-control" rows="16" placeholder="<?php echo $placeholder;
        ?>" name="<?php echo $name;
        ?>"><?php echo $value;
        ?></textarea>
     </div>
     <p><?php echo xss_clean($description);?></p><?php
    } elseif ($type == 'file-input') {
        ?>
        <div class="form-group">
          <label for="exampleInputFile"><?php echo $label;
        ?></label>
          <input <?php echo $disabled === true ? 'readonly="readonly"' : '';
        ?> type="file" id="exampleInputFile" name="<?php echo $name;
        ?>">
          <p class="help-block"><?php echo $description;?></p>
        </div>
        <?php

    } elseif ($type == 'checkbox') {
        if ($saver_enabled) {
            // control check
            $checked    =    $db_value == $value ? 'checked="checked"' : '';
        } else {
            // control check
            $checked    =    $active == $value ? 'checked="checked"' : '';
        }
        ?>
        <div class="checkbox">
          <label>
          	<input type="hidden" name="gui_delete_option_field[]" value="<?php echo $name;
        ?>"/>
            <input <?php echo $disabled === true ? 'disabled="disabled"' : '';
        ?> type="checkbox" value="<?php echo $value;
        ?>" name="<?php echo $name;
        ?>" <?php echo $checked;
        ?>/> <?php echo $label;
        ?>
          </label>
          <p class="help-block"><?php echo $description;?></p>
        </div>
        <?php

    } elseif ($type == 'radio') {
        ?>
        <div class="form-group">
		<?php
        foreach (force_array(riake('options', $_item)) as $radio_item) {
            if ($saver_enabled) {
                // control check
                $checked    =    $db_value == riake('value', $radio_item) ? 'checked="checked"' : '';
            } else {
                // control check
                $checked    =    riake('active', $_item) == riake('value', $radio_item) ? 'checked="checked"' : '';
            }
            // exception of repeat
            ?>
          <div class="radio">
            <label>
              <input <?php echo $disabled === true ? 'disabled="disabled"' : '';
            ?> type="radio" name="<?php echo riake('name', $radio_item);
            ?>" id="optionsRadios1" value="<?php echo riake('value', $radio_item);
            ?>" <?php echo $checked;
            ?>/>
              <?php echo riake('description', $radio_item);
            ?>
            </label>
            <p class="help-block"><?php echo $description;
            ?></p>
          </div>
		<?php

        }
        ?>
     </div>
     <?php

    } elseif (in_array($type, array( 'select', 'multiple' ))) {
        /**
     * Form
     *
     * add_meta( array(
     *		'type'	=>	'multiple',
     *		'options'	=>	array(
     *			array(
     *				'name'	=>	'foo',
     *				'value'	=>	'bar'
     *			)
     *		)
     *	) )
    **/
        $multiple = $type == 'multiple' ? $type : '';
        ?>
        <div class="form-group">
          <label><?php echo $label;
        ?></label>
          <select <?php echo $multiple;
        ?> <?php echo $disabled === true ? 'disabled="disabled"' : '';
        ?> class="form-control" name="<?php echo $name;
        ?>">
          	<?php
            foreach (force_array(riake('options', $_item)) as $value    =>    $text) {
                // Only when action is not changed (which send request to dashboard/options/set), Gui_saver is supported.
                if ($saver_enabled === true  && in_array(riake('action', riake('custom', $meta)), array( null, false ))) {
                    // control check
                    $selected    =    $db_value == $value ? 'selected="selected"' : '';
                } else {
                    if (! is_array($active = riake('active', $_item))) {
                        // control check
                        $selected    =    $active == $value ? 'selected="selected"' : '';
                    } else {
                        $selected  = in_array($value, $active) ? 'selected="selected"' : '';
                    }
                }
                ?>
            <option <?php echo $selected;
                ?> value="<?php echo $value;
                ?>"><?php echo $text;
                ?></option>
				<?php

            }
        ?>
          </select>
          <p class="help-block"><?php echo $description;
        ?></p>
        </div>
        <?php

    } elseif ($type == 'html-list') {
        /**
     *  ..add_meta( array(
             'type'		=>		'html-list',
            'options'	=>		array(
                array(
                    'type'	=>	'foo',
                    'text'	=>	'bar'
                )
            )
         ) );
    **/
        ?>
        <ul class="list-group">
        <?php
        foreach (force_array(riake('options', $_item)) as $list_option) {
            $type =    riake('type', $list_option);
            $text =    riake('text', $list_option);
            ?>
          <li class="list-group-item list-group-item-<?php echo $type;
            ?>"><?php echo $text;
            ?></li>
          <?php

        }
        ?>
        </ul>
        <?php

    } elseif ($type == 'dom') {
        echo riake('content', $_item);
    } elseif ($type == 'html-error') {
        ?>
        <div class="error-page">
            <h2 class="headline text-yellow"><?php echo riake('error-type', $_item);
        ?></h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> <?php echo riake('title', $_item);
        ?></h3>
              <p>
               <?php echo riake('content', $_item);
        ?>
              </p>
              <!--
              <form class="search-form">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search">
                  <div class="input-group-btn">
                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </form>
              -->
            </div><!-- /.error-content -->
          </div>
        <?php

    } elseif ($type == 'table') {
        /**
     * ->add_item( array(
     *		'type'		=>	'table',
     *		'cols'		=>	array( __( 'Id' ) , __( 'Title' ) , __( 'Name' ), __( 'Description' ) ),
     *		'rows'		=>	array(
     *			array( 1 , __( 'Custom 1' ) , __( 'Name 1' ) , __( 'Description' ) ),
     *			array( 1 , __( 'Custom 1' ) , __( 'Name 1' ) , __( 'Description' ) ),
     * 			array( 1 , __( 'Custom 1' ) , __( 'Name 1' ) , __( 'Description' ) ),
     *			array( 1 , __( 'Custom 1' ) , __( 'Name 1' ) , __( 'Description' ) )
     * 		)
     *	) , 'settings' , 2 );
    **/
    // Optional riake( 'width' , $_item )
    ?>
      <table class="table table-bordered">
        <tbody><tr>
        	<?php
            foreach (force_array(riake('cols', $_item)) as $index    =>    $_col) {
                ?>
          		<th style="<?php echo $width =    riake($index, riake('width', $_item)) ? 'width:' . $width . ';' : '';
                ?>"><?php echo $_col;
                ?></th>
                <?php

            }
        ?>
        </tr>
        <?php
        if (count(force_array(riake('rows', $_item))) > 0) {
            foreach (force_array(riake('rows', $_item)) as $index => $_row) {
                ?>
				<tr>
                	<?php
                    foreach (force_array($_row) as $_unique_col) {
                        ?>
				  <td><?php echo $_unique_col;
                        ?></td>
                  <?php

                    }
                ?>
				</tr>
				<?php
            }
        } else {
            ?>
            <tr>
            	<td colspan="<?php echo count(force_array(riake('cols', $_item)));
            ?>"><?php echo __('Empty table');
            ?></td>
            </tr>
            <?php

        }
        ?>

      </tbody></table>
        <?php

    } elseif ($type == 'buttons') {
        $value            = force_array(riake('value', $_item));
        $buttons_types    = force_array(riake('buttons_types', $_item, 'submit'));
        $name                = force_array(riake('name', $_item));
        $classes            = force_array(riake('classes', $_item, 'btn-primary'));
        $attrs_string    = force_array(riake('attrs_string', $_item, ''));
        ?>
<div class="form-group">
	<div class="input-group">
    	<?php foreach ($value as $_key => $_button) {
    ?>
	  <input class="btn btn-sm <?php echo riake($_key, $classes, 'btn-primary');
    ?>" <?php echo riake($_key, $attrs_string);
    ?> type="<?php echo riake($_key, $buttons_types, 'submit');
    ?>" name="<?php echo riake($_key, $name);
    ?>" value="<?php echo $_button ;
    ?>" style="margin-right:10px;">
      <?php

}
        ?>
	</div>
    <p class="help-block"><?php echo $description;
        ?></p>
</div>
		<?php

    }
}
