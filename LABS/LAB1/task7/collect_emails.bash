#!/bin/bash
grep -Eioh -r  '\b[A-Z0-9._%-]+@[A-Z0-9._%-]+\.[A-Z]+\b' /etc/ > emails.list
