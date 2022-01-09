---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Get-SlackWebChannelMessages

## SYNOPSIS
Gets all messages from a channel.

## SYNTAX

```
Get-SlackWebChannelMessages [-ChannelID] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets all messages from a channel. Does not return replies (messages in threads).

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SlackWebChannelMessages -ChannelID AAA1AAA1A
```

Returns all messages from the channel with an ID AAA1AAA1A

## PARAMETERS

### -ChannelID
The ID of a channel from which you want to retrieve messages. You can get this ID from a URL in the web-interface: https://app.slack.com/client/<Team ID>/<Channel ID>

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
