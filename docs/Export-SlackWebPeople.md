---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Export-SlackWebPeople

## SYNOPSIS
Exports all user accounts into a JSON-file.

## SYNTAX

```
Export-SlackWebPeople [-OutFile] <String> [<CommonParameters>]
```

## DESCRIPTION
Exports all user accounts from your workspace (and connected to it) into a JSON-file.

## EXAMPLES

### Example 1
```powershell
PS C:\> Export-SlackWebPeople -OutFile .\people.json
```

Exports all user accounts from your workspace (and connected to it) into the JSON-file people.json.

## PARAMETERS

### -OutFile
A path to the resulting file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

## NOTES

## RELATED LINKS
