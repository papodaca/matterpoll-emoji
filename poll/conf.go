package poll

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
)

type PollConf struct {
	Host string
	User PollUser
}

type PollUser struct {
	Id       string
	Password string
}

func LoadConf(path string) (*PollConf, error) {
	b, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var p PollConf
	json.Unmarshal(b, &p)
	if err := p.validate(); err != nil {
		return nil, err
	}
	return &p, nil
}

func (c *PollConf) validate() error {
	if len(c.Host) == 0 {
		return fmt.Errorf("Config `Host` is missing.")
	}
	if len(c.User.Id) == 0 {
		return fmt.Errorf("Config `Host` is missing.")
	}
	if len(c.User.Password) == 0 {
		return fmt.Errorf("Config `Host` is missing.")
	}
	return nil
}
