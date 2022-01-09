---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Export-SlackWebChannelHistory

## SYNOPSIS
Exports all messages and files from a channel, direct messages, or a group chat.

## SYNTAX

### Name
```
Export-SlackWebChannelHistory -Name <String> -OutFolder <String> [<CommonParameters>]
```

### ID
```
Export-SlackWebChannelHistory -ChannelID <String> -OutFolder <String> [<CommonParameters>]
```

## DESCRIPTION
Exports all messages, replies, and files from a channel, direct messages, or a group chat. The messages are put into a JSON-file. Files sent to the channel will have the channel ID and the unique file identifier as prefixes to their name.

## EXAMPLES

### Example 1
```powershell
PS C:\> Export-SlackWebChannelHistory -Name MyChannel -OutFolder .\export
```

Saves channel history from all channels available to you named "MyChannel" into the folder ".\export"

### Example 2
```powershell
PS C:\> Export-SlackWebChannelHistory -ChannelID AAA1AAA1A -OutFolder .\export
```

Saves channel history from the channel with ID AAA1AAA1A into the folder ".\export"

## PARAMETERS

### -ChannelID
The ID of a channel you want to export. You can get it from a URL in the web-interface: https://app.slack.com/client/<Team ID>/<Channel ID>

```yaml
Type: String
Parameter Sets: ID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of a channel(s) to export.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OutFolder
The path to a folder where you want to put the exported data.

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
