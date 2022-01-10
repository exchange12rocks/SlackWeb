---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Send-SlackWebMessage

## SYNOPSIS
Sends a message to one or several channels.

## SYNTAX

### ChannelName
```
Send-SlackWebMessage -ChannelName <String> -Text <String> [<CommonParameters>]
```

### ChannelID
```
Send-SlackWebMessage -ChannelID <String[]> -Text <String> [<CommonParameters>]
```

## DESCRIPTION
Sends a message to one or several channels.

## EXAMPLES

### Example 1
```powershell
PS C:\> Send-SlackWebMessage -ChannelName MyChannel -Text 'TEST'
```

Sends a plain-text message "TEST" to a channel called MyName.

### Example 2
```powershell
PS C:\> Send-SlackWebMessage -ChannelName MyC* -Text 'TEST'
```

Sends a plain-text message "TEST" to all channels which name starts with "MyC".

### Example 3
```powershell
PS C:\> Send-SlackWebMessage -ChannelID AAA1AAA1A -Text 'TEST'
```

Sends a plain-text message "TEST" to a channel with the ID "AAA1AAA1A".

### Example 4
```powershell
PS C:\> Send-SlackWebMessage -ChannelID AAA1AAA1A, BBB2BBB2B -Text 'TEST'
```

Sends a plain-text message "TEST" to channels with IDs "AAA1AAA1A" and "BBB2BBB2B".

## PARAMETERS

### -ChannelID
The ID of a channel(s) where you want to send a message. You can get it from a URL in the web-interface: https://app.slack.com/client/<Team ID>/<Channel ID>

```yaml
Type: String[]
Parameter Sets: ChannelID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChannelName
The ID of a channel(s) where you want to send a message.

```yaml
Type: String
Parameter Sets: ChannelName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Text
Text of your plain-text message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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
