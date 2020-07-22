for label in @columnLabels
  __out.push '\n    <select>\n        <option  value=\'\'>\n            Please select a form field label.\n        </option>\n    </select>\n\n    '
  if label
    __out.push '\n        <i class=\'column-alert\' title=\'one\'></i>\n    '
  else
    __out.push '\n        <i class=\'column-alert\' title=\'Values in this column will not\'></i>\n    '
  __out.push '\n'
__out.push '\n'
