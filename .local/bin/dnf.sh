#!/bin/sh
diff before after | grep -E "^> /" | sed "s/> //"
