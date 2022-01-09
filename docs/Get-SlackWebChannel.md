---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Get-SlackWebChannel

## SYNOPSIS
Lets you find either a specific channel or get a list of all of them.

## SYNTAX

```
Get-SlackWebChannel [[-Name] <String>] [[-SearchString] <String>] [-ExcludeMine] [<CommonParameters>]
```

## DESCRIPTION
Lets you find either a specific channel or get a list of all of them. You can get only channels to which you have access.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SlackWebChannel
```

Returns all channels to which you have access

### Example 2
```powershell
PS C:\> Get-SlackWebChannel -Name MyChannel
```

Returns all channels that have the name "MyChannel".

### Example 3
```powershell
PS C:\> Get-SlackWebChannel -Name '*MyChannel*' -SearchString 'admin'
```

Returns all channels that have "MyChannel" in their name AND "admin" the the name or the description.

### Example w
```powershell
PS C:\> Get-SlackWebChannel -SearchString 'admin'
```

Returns all channels that have "admin" the the name or the description.

## PARAMETERS

### -ExcludeMine
Excludes channels which you are member of from the resulting output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of a channel you want to get in return.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SearchString
Use this as you would you the search field on the Slack channels page.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
