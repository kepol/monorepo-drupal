@paragraph @civic_callout
Feature: Tests the Callout

  Ensure that Callout paragraph exists and has the expected fields.

  @api
  Scenario: Paragraph type appears in the paragraph types page
    Given I am logged in as a user with the "Site Administrator" role
    When I go to "admin/structure/paragraphs_type"
    Then I should see the text "Callout" in the "civic_callout" row

  @api
  Scenario: Content paragraph exists with fields.
    Given I am logged in as a user with the "Site Administrator" role
    When I go to "admin/structure/paragraphs_type/civic_callout/fields"
    And I should see the text "field_p_title" in the "Title" row
    And I should see the text "field_p_theme" in the "Theme" row
    And I should see the text "field_p_summary" in the "Summary" row
    And I should see the text "field_p_links" in the "Links" row

  @api @javascript
  Scenario: Show relevant fields depending on the 'Content type' selected
    Given I am logged in as a user with the "Site Administrator" role
    When I visit "node/add/civic_page"
    And I fill in "Title" with "[TEST] Page fields"
    And I click on "div.field--name-field-n-components .paragraphs-add-wrapper .dropbutton-toggle button" element
    And I wait for AJAX to finish
    And I press the "field_n_components_civic_callout_add_more" button
    And I wait for AJAX to finish
    And should see an "select[name='field_n_components[0][subform][field_p_theme]']" element
    And should see an "select[name='field_n_components[0][subform][field_p_theme]'].required" element
    And should see an "input[name='field_n_components[0][subform][field_p_title][0][value]']" element
    And should see an "input[name='field_n_components[0][subform][field_p_title][0][value]'].required" element
    And should see an "textarea[name='field_n_components[0][subform][field_p_summary][0][value]']" element
    And should see an "textarea[name='field_n_components[0][subform][field_p_summary][0][value]'].required" element
    And should see an "input[name='field_n_components[0][subform][field_p_links][0][uri]']" element
    And should see an "input[name='field_n_components[0][subform][field_p_links][0][uri]'].required" element

  @api @javascript
  Scenario: Component Block paragraph reference exists and works
    Given I am logged in as a user with the "Site Administrator" role
    When I go to "block/add/civic_component_block"
    And I click on "div.field--name-field-b-components .paragraphs-add-wrapper .dropbutton-toggle button" element
    And I wait for AJAX to finish
    And I press the "field_b_components_civic_callout_add_more" button
    And I wait for AJAX to finish
    And should see an "select[name='field_b_components[0][subform][field_p_theme]']" element
    And should see an "select[name='field_b_components[0][subform][field_p_theme]'].required" element
    And should see an "input[name='field_b_components[0][subform][field_p_title][0][value]']" element
    And should see an "input[name='field_b_components[0][subform][field_p_title][0][value]'].required" element
    And should see an "textarea[name='field_b_components[0][subform][field_p_summary][0][value]']" element
    And should see an "textarea[name='field_b_components[0][subform][field_p_summary][0][value]'].required" element
    And should see an "input[name='field_b_components[0][subform][field_p_links][0][uri]']" element
    And should see an "input[name='field_b_components[0][subform][field_p_links][0][uri]'].required" element