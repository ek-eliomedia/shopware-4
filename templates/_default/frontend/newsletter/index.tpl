{extends file="frontend/index/index.tpl"}

{* Breadcrumb *}
{block name='frontend_index_start' append}
	{$sBreadcrumb = [['name'=>"{s name='NewsletterTitle'}{/s}", 'link'=>{url}]]}
{/block}

{block name="frontend_index_content"}
	<div class="grid_16 tellafriend" id="center">
	
		{if $sStatus.code==3||$sStatus.code==2}
			<div class="success bold">
				{$sStatus.message}
			</div>
		{elseif $sStatus.code != 0}
			<div class="error bold">
				{$sStatus.message}
			</div>
		{/if}
	
		{if $voteConfirmed == false || $sStatus.code == 0}
			<div class="contact_box register">
				<h2 class="headingbox_dark largesize">{s name=NewsletterRegisterHeadline}{/s}</h2>
				<form action="{url controller='newsletter'}" method="post" id="letterForm">	
					<fieldset>
					<p>
						<label>{s name=NewsletterLabelSelect}{/s}</label>
						<select id="chkmail" name="subscribeToNewsletter" class="text" onchange="refreshAction();">
							<option value="1">{s name=sNewsletterOptionSubscribe}{/s}</option>
							<option value="-1" {if $_POST.subscribeToNewsletter eq -1 || (!$_POST.subscribeToNewsletter && $sUnsubscribe == true)}selected{/if}>{s name=sNewsletterOptionUnsubscribe}{/s}</option>
						</select>
					</p>
					<p>
						<label for="newsletter">{s name=sNewsletterLabelMail}{/s}</label>
						<input name="newsletter" type="text" id="newsletter" value="{if $_POST.newsletter}{$_POST.newsletter}{elseif $_GET.sNewsletter}{$_GET.sNewsletter|escape}{/if}" class="text {if $sStatus.sErrorFlag.newsletter}instyle_error{/if}" />
					</p>
					{if {config name=NewsletterExtendedFields}}
						<div id="sAdditionalForm">
							<p>
								<label for="salutation">{s name=NewsletterRegisterLabelSalutation}{/s}</label>
								<select name="salutation" id="salutation" class="text{if $sStatus.sErrorFlag.salutation} instyle_error{/if}">
								    <option value="">{s name=NewsletterRegisterPleaseChoose}{/s}</option>
								    <option value="mr" {if $_POST.salutation eq "mr"}selected{/if}>{s name=NewsletterRegisterLabelMr}{/s}</option>  
								    <option value="ms" {if $_POST.salutation eq "ms"}selected{/if}>{s name=NewsletterRegisterLabelMs}{/s}</option>  
								</select>
							</p>
					
							<p>
								<label for="firstname">{s name=NewsletterRegisterLabelFirstname}{/s}</label>
								<input name="firstname" type="text"  id="firstname" value="{$_POST.firstname|escape}" class="text {if $sStatus.sErrorFlag.firstname}instyle_error{/if}" />
							</p>
									
							<p>
								<label for="lastname">{s name=NewsletterRegisterLabelLastname}{/s}</label>
								<input name="lastname" type="text"  id="lastname" value="{$_POST.lastname|escape}" class="text {if $sStatus.sErrorFlag.lastname}instyle_error{/if}" />
							</p>
							
							<p>
								<label for="street">{s name=NewsletterRegisterBillingLabelStreet}{/s}</label>
								<input name="street" type="text"  id="street" value="{$_POST.street|escape}" class="street text {if $sStatus.sErrorFlag.street}instyle_error{/if}" />
								<input name="streetnumber" type="text"  id="streetnumber" value="{$_POST.streetnumber|escape}"  maxlength="5" class="number text {if $sStatus.sErrorFlag.streetnumber}instyle_error{/if}" />
							</p>
							
							<p>
								<label for="zipcode">{s name=NewsletterRegisterBillingLabelCity}{/s}</label>
								<input name="zipcode" type="text" id="zipcode" value="{$_POST.zipcode|escape}" maxlength="5" class="zipcode text {if $sStatus.sErrorFlag.zipcode}instyle_error{/if}" />
								<input name="city" type="text"  id="city" value="{$_POST.city|escape}" size="25" class="city text {if $sStatus.sErrorFlag.city}instyle_error{/if}" />
							</p>
						</div>
						{literal}<script type="text/javascript">
						function refreshAction()
						{
							if ($('#chkmail').val()==-1)
							{
								$('#sAdditionalForm').hide();
							}
							else
							{
								$('#sAdditionalForm').show();
							}
						}
						refreshAction();
						</script>{/literal}
					{/if}
					<div class="clear">&nbsp;</div>
					<p class="description">
						{s name=sNewsletterInfo}{/s}
					</p>
					
					{* Required fields hint *}
					<div class="required_fields">
						{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}
					</div>
					
					<input type="submit" value="{s name=sNewsletterButton}{/s}" class="button-right large" />	
					</fieldset>
				</form>
				<hr class="clear" />
				</div>
		{/if}
	</div>
{/block}