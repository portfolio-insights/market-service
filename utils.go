package main

import (
	"encoding/json"
	"net/http"
)

func RespondIfError(condition bool, w http.ResponseWriter, message string, statusCode int) bool {
	if !condition {
		return false
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	json.NewEncoder(w).Encode(map[string]string{
		"detail": message,
	})
	return true
}
