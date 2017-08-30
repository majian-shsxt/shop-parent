<html>
<head>

</head>
<body>
<div>
    <br>无Body:<br>
[@hello_world name="Lilin" ]
${helloworld.name}: ${helloworld.content}
[/@hello_world]<br>

    ----------------------------
    <br>无Body:<br>
[@hello_world name="Lilin" /]
</div>
</body>
</html>

[#--
if (body != null) {
body.render(env.getOut());
} else {
env.getOut().write(JSON.toJSONString(result));
}--]
