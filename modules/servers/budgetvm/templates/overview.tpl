
    
<h2>Overview</h2>
<hr>
 <div class="so_buttons">
                <button class="btn" id="btn_boot">
                    <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&customAction=reverse"><img class="manage_img" src="{$WEB_ROOT}/images/assets/rebuild.png" />Reverse DNS</a>
                </button>
                <button class="btn" id="btn_reboot">
                    <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&customAction=network"><img class="manage_img" src="{$WEB_ROOT}/images/assets/graphs.png" />Network Graphs</a>
                </button>
                <button class="btn" id="btn_stop">
                     <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&customAction=power"><img class="manage_img" src="{$WEB_ROOT}/images/assets/shutdown.png" />Power</a>
                </button>
                <button class="btn" id="btn_reinstall">
                     <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&customAction=reinstall"><img class="manage_img" src="{$WEB_ROOT}/images/assets/repeat.png" />Reinstall Server</a>
                </button>   
                <button class="btn" id="btn_console" >
                     <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&customAction=ipmi"><img class="manage_img"  src="{$WEB_ROOT}/images/assets/console.png" />VNC (IPMI)</a>
                </button>
              
            </div>
<h3>System Information</h3>
<hr>
<div class="row">
  <div class="col-sm-5">Power Status</div>
  <div class="col-sm-7">
  {if $budgetvm->status == "on" || $budgetvm->status == "online"}
    <span class="label label-success">Online</span>
  {else}
    <span class="label label-danger">{$budgetvm->status}</span>
  {/if}
  </div>
</div>
{if $budgetvm->type eq "dedicated"}
  <h3>Device Hardware</h3>
  <hr>
  {foreach from=$budgetvm->device->parts key=type item=part}
    {foreach key=k item=v from=$part}
    <div class="row">
      <div class="col-sm-6">{$type} {$k + 1}</div>
      <div class="col-sm-6">{$v}</div>
    </div>
    {/foreach}
  {/foreach}
  <h3>Network Ports</h3>
  <hr>
  {foreach from=$budgetvm->device->ports key=switch item=switchData}
    {foreach key=port item=data from=$switchData}
    <div class="row">
      <div class="col-sm-3">
        {$switch}
      </div>
      <div class="col-sm-3">
        {$port}
      </div>
      {if $data->ifAdminStatus == 'Up' && $data->ifOperStatus == 'Up'} 
        <div class="col-sm-3">
          <span class="label label-success">Port Online - {$data->ifSpeed}</span>
        </div>
      {else}
        <div class="col-sm-3">
          <span class="label label-danger">Port Offline - {$data->ifSpeed}</span>
        </div>
      {/if}
      <div class="col-sm-3">
        <a href="clientarea.php?action=productdetails&id={$budgetvm->service}&modop=custom&a=network&portid={$data->id}" class="btn btn-primary">View Graph</a>
      </div>
    </div>
    {/foreach}
  {/foreach}
{else}
  <div class="row">
    <div class="col-sm-5">
      Virtualization
    </div>
    <div class="col-sm-7">
      {$budgetvm->device->type}
    </div>
  </div>
  <div class="row">
    <div class="col-sm-5">
      Hardware Node
    </div>
    <div class="col-sm-7">
      {$budgetvm->device->node}
    </div>
  </div>
  <div class="row">
    <div class="col-sm-5">
      Memory
    </div>
    <div class="col-sm-7">
      {$budgetvm->device->memory} MB
    </div>
  </div>
  <div class="row">
    <div class="col-sm-5">
      Hard Disk
    </div>
    <div class="col-sm-7">
      {$budgetvm->device->harddisk} GB
    </div>
  </div>
  <div class="row">
    <div class="col-sm-5">
      Bandwidth
    </div>
    <div class="col-sm-7">
      {$budgetvm->device->bandwidth} GB
    </div>
  </div>

{/if}
<h3>{$LANG.clientareaproductdetails}</h3>
<hr>
<div class="row">
  <div class="col-sm-5">
    {$LANG.clientareahostingregdate}
  </div>
  <div class="col-sm-7">
    {$regdate}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.orderproduct}
  </div>
  <div class="col-sm-7">
    {$groupname} - {$product}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.clientareastatus}
  </div>
  <div class="col-sm-7">
    {$status}
  </div>
</div>

{if $suspendreason}
  <div class="row">
    <div class="col-sm-5">
      {$LANG.suspendreason}
    </div>
    <div class="col-sm-7">
      {$suspendreason}
    </div>
  </div>
{/if}


{if $type eq "server"}
  {if $domain}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.serverhostname}
      </div>
      <div class="col-sm-7">
        {$domain}
      </div>
    </div>
  {/if}
  
  {if $ns1 || $ns2}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.domainnameservers}
      </div>
      <div class="col-sm-7">
        {$ns1}<br />{$ns2}
      </div>
    </div>
  {/if}
{else}
  {if $domain}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.orderdomain}
      </div>
      <div class="col-sm-7">
        {$domain}
        <a href="http://{$domain}" target="_blank" class="btn btn-default btn-xs">{$LANG.visitwebsite}</a>
      </div>
    </div>
  {/if}
  {if $username}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.serverusername}
      </div>
      <div class="col-sm-7">
        {$username}
      </div>
    </div>
  {/if}
{/if}



{foreach from=$configurableoptions item=configoption}
  <div class="row">
    <div class="col-sm-5">
      {$configoption.optionname}
    </div>
    <div class="col-sm-7">
      {if $configoption.optiontype eq 3}
        {if $configoption.selectedqty}
          {$LANG.yes}
        {else}
          {$LANG.no}
        {/if}
      {elseif $configoption.optiontype eq 4}
        {$configoption.selectedqty} x {$configoption.selectedoption}
      {else}
        {$configoption.selectedoption}
      {/if}
    </div>
  </div>
{/foreach}

{foreach from=$productcustomfields item=customfield}
  <div class="row">
    <div class="col-sm-5">
      {$customfield.name}
    </div>
    <div class="col-sm-7">
      {$customfield.value}
    </div>
  </div>
{/foreach}

{if $dedicatedip}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.primaryIP}
      </div>
      <div class="col-sm-7">
        {$dedicatedip}
      </div>
    </div>
  {/if}
  {if $assignedips}
    <div class="row">
      <div class="col-sm-5">
        {$LANG.assignedIPs}
      </div>
      <div class="col-sm-7">
        {$assignedips|nl2br}
      </div>
    </div>
  {/if}
<h3>{$LANG.cPanel.billingOverview}</h3>
<hr>

<div class="row">
  <div class="col-sm-5">
    {$LANG.orderpaymentmethod}
  </div>
  <div class="col-sm-7">
    {$paymentmethod}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.firstpaymentamount}
  </div>
  <div class="col-sm-7">
    {$firstpaymentamount}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.recurringamount}
  </div>
  <div class="col-sm-7">
    {$recurringamount}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.clientareahostingnextduedate}
  </div>
  <div class="col-sm-7">
    {$nextduedate}
  </div>
</div>

<div class="row">
  <div class="col-sm-5">
    {$LANG.orderbillingcycle}
  </div>
  <div class="col-sm-7">
    {$billingcycle}
  </div>
</div>


<hr>
<div class="row">
  
  {if $packagesupgrade}
    <div class="col-sm-4">
      <a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-success btn-block">
        {$LANG.upgrade}
      </a>
    </div>
  {/if}

  <div class="col-sm-4">
    <a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-danger btn-block{if $pendingcancellation}disabled{/if}">
      {if $pendingcancellation}
        {$LANG.cancellationrequested}
      {else}
        {$LANG.cancel}
      {/if}
    </a>
  </div>
</div>
