"""LICENSE
Copyright 2019 Hermann Krumrey <hermann@krumreyh.com>

This file is part of xkcd-bot.

xkcd-bot is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

xkcd-bot is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with xkcd-bot.  If not, see <http://www.gnu.org/licenses/>.
LICENSE"""

from typing import List, Dict, Any
from kudubot.Bot import Bot
from kudubot.db.Address import Address
from kudubot.parsing.CommandParser import CommandParser
from sqlalchemy.orm import Session
from xkcd_bot import version
from xkcd_bot.XkcdCommandParser import XkcdCommandParser


class XkcdBot(Bot):
    """
    The Xkcd Bot class that defines the bot's functionality
    """

    @classmethod
    def name(cls) -> str:
        """
        :return: The name of the bot
        """
        return "xkcd-bot"

    @classmethod
    def version(cls) -> str:
        """
        :return: The current version of the bot
        """
        return version

    @classmethod
    def parsers(cls) -> List[CommandParser]:
        """
        :return: A list of parser the bot supports for commands
        """
        return [XkcdCommandParser()]

    def on_subscribe(
            self,
            address: Address,
            args: Dict[str, Any],
            db_session: Session
    ):
        pass

    def on_unsubscribe(
            self,
            address: Address,
            args: Dict[str, Any],
            db_session: Session
    ):
        pass

    def on_new(
            self,
            address: Address,
            args: Dict[str, Any],
            db_session: Session
    ):
        pass

    def on_show(
            self,
            address: Address,
            args: Dict[str, Any],
            db_session: Session
    ):
        pass

    def bg_iteration(self, _: int, db_session: Session):
        """
        Periodically checks for new notifications and sends them out
        :param _: The iteration count
        :param db_session: The database session to use
        :return: None
        """
        pass
